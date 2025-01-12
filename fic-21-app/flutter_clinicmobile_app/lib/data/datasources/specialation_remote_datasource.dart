import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter_clinicmobile_app/core/constants/global_variable.dart';
import 'package:flutter_clinicmobile_app/data/datasources/auth_local_datasource.dart';
import 'package:flutter_clinicmobile_app/data/models/response/specialation_response_model.dart';
import 'package:http/http.dart' as http;

class SpecialationRemoteDatasource {
  Future<Either<String, SpecialationResponseModel>> getSpecialations() async {
    final userData = await AuthLocalDatasource().getUserData();
    final response = await http.get(
      Uri.parse("${GlobalVariable.baseUrl}/api/specialists"),
      headers: {
        'Authorization': 'Bearer ${userData?.data?.token}',
        'Accept': 'application/json',
      },
    );
    log("Status Code: ${response.statusCode}");
    log("Body: ${response.body}");
    if (response.statusCode == 200) {
      return Right(SpecialationResponseModel.fromJson(response.body));
    } else {
      final message = jsonDecode(response.body)['message'];
      return Left(message);
    }
  }
}
