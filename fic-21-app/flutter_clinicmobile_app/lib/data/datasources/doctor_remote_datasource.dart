import 'dart:convert';
import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:flutter_clinicmobile_app/core/constants/global_variable.dart';
import 'package:flutter_clinicmobile_app/data/datasources/auth_local_datasource.dart';
import 'package:flutter_clinicmobile_app/data/models/request/doctor_request_model.dart';
import 'package:flutter_clinicmobile_app/data/models/response/doctor_response_model.dart';
import 'package:http/http.dart' as http;

import '../models/response/clinic_response_model.dart';

class DoctorRemoteDatasource {
  Future<Either<String, DoctorResponseModel>> getDoctors() async {
    final userData = await AuthLocalDatasource().getUserData();
    final response = await http.get(
      Uri.parse('${GlobalVariable.baseUrl}/api/doctors'),
      headers: {
        'Authorization': 'Bearer ${userData?.data?.token}',
        'Accept': 'application/json',
      },
    );
    log("StatusCode : ${response.statusCode}");
    log("Body: ${response.body}");
    if (response.statusCode == 200) {
      return Right(DoctorResponseModel.fromMap(jsonDecode(response.body)));
    } else {
      final message = jsonDecode(response.body)['message'];
      return Left(message);
    }
  }

  Future<Either<String, String>> addDoctor(DoctorRequestModel model) async {
    final userData = await AuthLocalDatasource().getUserData();
    final Map<String, String> headers = {
      'Authorization': 'Bearer ${userData?.data?.token}',
    };
    var request = http.MultipartRequest(
        'POST', Uri.parse('${GlobalVariable.baseUrl}/api/doctors'));
    request.fields.addAll(model.toMap());
    if (model.image != null) {
      request.files
          .add(await http.MultipartFile.fromPath('image', model.image!.path));
    }
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    final String body = await response.stream.bytesToString();
    log(response.stream.toString());
    log(response.statusCode.toString());

    if (response.statusCode == 200 || response.statusCode == 201) {
      final message = jsonDecode(body)['status'];
      return Right(message);
    } else {
      final message = jsonDecode(body)['message'];
      return Left(message);
    }
  }

  Future<Either<String, String>> deleteDoctor(String id) async {
    final userData = await AuthLocalDatasource().getUserData();
    final response = await http.delete(
      Uri.parse('${GlobalVariable.baseUrl}/api/doctors/$id'),
      headers: {
        'Authorization': 'Bearer ${userData?.data?.token}',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return const Right('Success');
    } else {
      final message = jsonDecode(response.body)['message'];
      return Left(message);
    }
  }

  Future<Either<String, DoctorResponseModel>> getDoctorsActive() async {
    final userData = await AuthLocalDatasource().getUserData();
    final response = await http.get(
      Uri.parse('${GlobalVariable.baseUrl}/api/doctors/active'),
      headers: {
        'Authorization': 'Bearer ${userData?.data?.token}',
        'Accept': 'application/json',
      },
    );
    log("StatusCode : ${response.statusCode}");
    log("Body: ${response.body}");
    if (response.statusCode == 200) {
      return Right(DoctorResponseModel.fromMap(jsonDecode(response.body)));
    } else {
      final message = jsonDecode(response.body)['message'];
      return Left(message);
    }
  }

  Future<Either<String, ClinicResponseModel>> getClinicDetail() async {
    final userData = await AuthLocalDatasource().getUserData();
    final response = await http.get(
      Uri.parse(
          '${GlobalVariable.baseUrl}/api/clinic/${userData?.data?.user?.clinicId}'),
      headers: {
        'Authorization': 'Bearer ${userData?.data?.token}',
        'Accept': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      return Right(ClinicResponseModel.fromMap(jsonDecode(response.body)));
    } else {
      final message = jsonDecode(response.body)['message'];
      return Left(message);
    }
  }
}
