import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter_clinicmobile_app/core/constants/global_variable.dart';
import 'package:flutter_clinicmobile_app/data/datasources/auth_local_datasource.dart';
import 'package:flutter_clinicmobile_app/data/models/request/user_request_model.dart';
import 'package:flutter_clinicmobile_app/data/models/response/login_response_model.dart';
import 'package:http/http.dart' as http;

class UserRemoteDatasource {

  Future<Either<String, UserModel>> updateUser(
      UserRequestModel model,
      ) async {
    final userData = await AuthLocalDatasource().getUserData();
    final Map<String, String> headers = {
      'Authorization': 'Bearer ${userData?.data?.token}',
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };
    final response = await http.put(
      Uri.parse("${GlobalVariable.baseUrl}/api/user/${userData?.data?.user?.id}"),
      headers: headers,
      body: model.toJson(),
    );
    log(model.toJson());
    log(response.statusCode.toString());
    log(response.body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = jsonDecode(response.body)['data'];
      return Right(UserModel.fromMap(data));
    } else {
      final message = jsonDecode(response.body)['message'];
      return Left(message);
    }
  }


}
