import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_clinicmobile_app/core/constants/global_variable.dart';
import 'package:flutter_clinicmobile_app/data/datasources/auth_local_datasource.dart';
import 'package:flutter_clinicmobile_app/data/models/request/agora_request_model.dart';
import 'package:flutter_clinicmobile_app/data/models/response/agora_response_model.dart';
import 'package:http/http.dart' as http;

class AgoraRemoteDatasource {
  Future<Either<String, AgoraResponseModel>> getAgoraCalls() async {
    final userData = await AuthLocalDatasource().getUserData();
    final response = await http.get(
      Uri.parse('${GlobalVariable.baseUrl}/api/agora-calls'),
      headers: {
        'Authorization': 'Bearer ${userData?.data?.token}',
        'Accept': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      return Right(AgoraResponseModel.fromMap(jsonDecode(response.body)));
    } else {
      final message = jsonDecode(response.body)['message'];
      return Left(message);
    }
  }

  Future<Either<String, String>> addAgoraCall(AgoraRequestModel model) async {
    final userData = await AuthLocalDatasource().getUserData();
    final response = await http.post(
      Uri.parse('${GlobalVariable.baseUrl}/api/agora-call'),
      headers: {
        'Authorization': 'Bearer ${userData?.data?.token}',
        'Accept': 'application/json',
      },
      body: model.toJson(),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final message = jsonDecode(response.body)['message'];
      return Right(message);
    } else {
      final message = jsonDecode(response.body)['message'];
      return Left(message);
    }
  }
}
