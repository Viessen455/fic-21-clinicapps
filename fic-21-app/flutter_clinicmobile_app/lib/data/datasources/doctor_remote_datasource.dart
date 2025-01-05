import 'package:dartz/dartz.dart';
import 'package:flutter_clinicmobile_app/core/constants/global_variable.dart';
import 'package:flutter_clinicmobile_app/data/models/doctor_response_model.dart';
import 'package:http/http.dart' as http;

class DoctorRemoteDataSource {
  Future<Either<String, DoctorResponseModel>> getDoctorTelemedis() async {
    final response = await  http.get(Uri.parse('${GlobalVariable.baseUrl}/api/doctors/active'),
    headers: {
      'Content-Type' : "application/json",
      'Accept' : "application/json",
    });

    if(response.statusCode == 200){
      return Right(DoctorResponseModel.fromJson(response.body));
    }else{
      return Left("Failed To Load Data");
    }

  }

  Future<DoctorResponseModel> getDoctorChats() async {
    final response = await  http.get(Uri.parse('${GlobalVariable.baseUrl}/api/doctors/active'),
        headers: {
          'Content-Type' : "application/json",
          'Accept' : "application/json",
        });

    if(response.statusCode == 200){
      return DoctorResponseModel.fromJson(response.body);
    }else{
      throw Exception('Failed To Load Data');
    }

  }



}



