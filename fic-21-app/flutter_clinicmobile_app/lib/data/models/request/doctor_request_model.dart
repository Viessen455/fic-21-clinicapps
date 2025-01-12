import 'package:image_picker/image_picker.dart';

class DoctorRequestModel {
  final String name;
  final String email;
  final String role;

  final String status;
  final String gender;
  final String certification;
  final int specialationId;
  final String telemedicineFee;
  final String chatFee;
  final String startTime;
  final String endTime;
  final String clinicId;

  final XFile? image;

  DoctorRequestModel({
    required this.name,
    required this.email,
    required this.role,
    required this.status,
    required this.gender,
    required this.certification,
    required this.specialationId,
    required this.telemedicineFee,
    required this.chatFee,
    required this.startTime,
    required this.endTime,
    required this.clinicId,
    this.image,
  });

  Map<String, String> toMap() => {
    "name": name,
    "email": email,
    "role": role,
    "gender": gender,
    "certification": certification,
    "specialist_id": specialationId.toString(),
    "telemedicine_fee": telemedicineFee,
    "chat_fee": chatFee,
    "start_time": startTime,
    "end_time": endTime,
    "clinic_id": clinicId,
    'status': status,
  };

  Map<String, String> toUpdateMap() => {
    "name": name,
    "email": email,
    "role": role,
    "gender": gender,
    "certification": certification,
    "specialist_id": specialationId.toString(),
    "telemedicine_fee": telemedicineFee,
    "chat_fee": chatFee,
    "start_time": startTime,
    "end_time": endTime,
    "clinic_id": clinicId,
    'status': status,
  };
}
