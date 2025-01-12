import 'dart:convert';
import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:flutter_clinicmobile_app/core/constants/global_variable.dart';
import 'package:flutter_clinicmobile_app/data/datasources/auth_local_datasource.dart';
import 'package:flutter_clinicmobile_app/data/models/request/order_request_model.dart';
import 'package:flutter_clinicmobile_app/data/models/response/create_order_response_model.dart';
import 'package:flutter_clinicmobile_app/data/models/response/order_response_model.dart';
import 'package:http/http.dart' as http;

class OrderRemoteDatasource {
  Future<Either<String, OrderResponseModel>> getOrdersByClinic() async {
    final userData = await AuthLocalDatasource().getUserData();
    final response = await http.get(
      Uri.parse(
          '${GlobalVariable.baseUrl}/api/orders/clinic/${userData?.data?.user?.clinicId}'),
      headers: {
        'Authorization': 'Bearer ${userData?.data?.token}',
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return Right(OrderResponseModel.fromMap(jsonDecode(response.body)));
    } else {
      final message = jsonDecode(response.body)['message'];
      return Left(message);
    }
  }

  Future<Either<String, CreateOrderResponseModel>> createOrder(
      OrderRequestModel model) async {
    final userData = await AuthLocalDatasource().getUserData();
    final response = await http.post(
      Uri.parse('${GlobalVariable.baseUrl}/api/orders'),
      headers: {
        'Authorization': 'Bearer ${userData?.data?.token}',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
      body: model.toJson(),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return Right(CreateOrderResponseModel.fromMap(jsonDecode(response.body)));
    } else {
      final message = jsonDecode(response.body)['message'];
      return Left(message);
    }
  }


  Future<Either<String, OrderResponseModel>> getOrdersByPatient() async {
    final userData = await AuthLocalDatasource().getUserData();
    final response = await http.get(
      Uri.parse(
          '${GlobalVariable.baseUrl}/api/orders/patient/${userData?.data?.user?.id}'),
      headers: {
        'Authorization': 'Bearer ${userData?.data?.token}',
        'Accept': 'application/json',
      },
    );
    log("Status Code: ${response.statusCode}");
    log("Status Code: ${response.body}");
    if (response.statusCode == 200) {
      return Right(OrderResponseModel.fromMap(jsonDecode(response.body)));
    } else {
      final message = jsonDecode(response.body)['message'];
      return Left(message);
    }
  }

  Future<Either<String, OrderResponseModel>> getOrdersByDoctor() async {
    final userData = await AuthLocalDatasource().getUserData();
    final response = await http.get(
      Uri.parse(
          '${GlobalVariable.baseUrl}/api/orders/doctor/${userData?.data?.user?.id}'),
      headers: {
        'Authorization': 'Bearer ${userData?.data?.token}',
        'Accept': 'application/json',
      },
    );
    log("Status Code: ${response.statusCode}");
    log("Status Code: ${response.body}");
    if (response.statusCode == 200) {
      return Right(OrderResponseModel.fromMap(jsonDecode(response.body)));
    } else {
      final message = jsonDecode(response.body)['message'];
      return Left(message);
    }
  }

  Future<Either<String, OrderResponseModel>> getOrdersByDoctorQuery(
      String service, String statusService) async {
    final userData = await AuthLocalDatasource().getUserData();
    final response = await http.get(
      Uri.parse(
          '${GlobalVariable.baseUrl}/api/orders/doctor/${userData!.data!.user!.id!}/$service/$statusService'),
      headers: {
        'Authorization': 'Bearer ${userData.data!.token}',
        'Accept': 'application/json',
      },
    );
    log("URL: ${response.request!.url}");
    log("Status Code: ${response.statusCode}");
    log("Status Code: ${response.body}");
    if (response.statusCode == 200) {
      return Right(OrderResponseModel.fromMap(jsonDecode(response.body)));
    } else {
      final message = jsonDecode(response.body)['message'];
      return Left(message);
    }
  }

}
