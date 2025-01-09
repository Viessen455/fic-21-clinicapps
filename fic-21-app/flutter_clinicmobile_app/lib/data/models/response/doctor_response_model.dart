import 'dart:convert';

class DoctorResponseModel {
  final String? status;
  final List<User>? data;

  DoctorResponseModel({
    this.status,
    this.data,
  });

  factory DoctorResponseModel.fromJson(String str) =>
      DoctorResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DoctorResponseModel.fromMap(Map<String, dynamic> json) =>
      DoctorResponseModel(
        status: json["status"],
        data: json["data"] == null
            ? []
            : List<User>.from(json["data"]!.map((x) => User.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
    "status": status,
    "data":
    data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
  };
}

class User {
  final int? id;
  final String? name;
  final String? email;
  final dynamic emailVerifiedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? role;
  final dynamic googleId;
  final dynamic ktpNumber;
  final dynamic birthDate;
  final dynamic gender;
  final dynamic phoneNumber;
  final dynamic address;
  final String? certification;
  final int? telemedicineFee;
  final int? chatFee;
  final String? startTime;
  final String? endTime;
  final int? clinicId;
  final String? image;
  final int? specialistId;
  final String? status;
  final Clinic? clinic;
  final Specialist? specialist;

  User({
    this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
    this.role,
    this.googleId,
    this.ktpNumber,
    this.birthDate,
    this.gender,
    this.phoneNumber,
    this.address,
    this.certification,
    this.telemedicineFee,
    this.chatFee,
    this.startTime,
    this.endTime,
    this.clinicId,
    this.image,
    this.specialistId,
    this.status,
    this.clinic,
    this.specialist,
  });

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    emailVerifiedAt: json["email_verified_at"],
    createdAt: json["created_at"] == null
        ? null
        : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null
        ? null
        : DateTime.parse(json["updated_at"]),
    role: json["role"],
    googleId: json["google_id"],
    ktpNumber: json["ktp_number"],
    birthDate: json["birth_date"],
    gender: json["gender"],
    phoneNumber: json["phone_number"],
    address: json["address"],
    certification: json["certification"],
    telemedicineFee: json["telemedicine_fee"],
    chatFee: json["chat_fee"],
    startTime: json["start_time"],
    endTime: json["end_time"],
    clinicId: json["clinic_id"],
    image: json["image"],
    specialistId: json["specialist_id"],
    status: json["status"],
    clinic: json["clinic"] == null ? null : Clinic.fromMap(json["clinic"]),
    specialist: json["specialist"] == null
        ? null
        : Specialist.fromMap(json["specialist"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "email": email,
    "email_verified_at": emailVerifiedAt,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "role": role,
    "google_id": googleId,
    "ktp_number": ktpNumber,
    "birth_date": birthDate,
    "gender": gender,
    "phone_number": phoneNumber,
    "address": address,
    "certification": certification,
    "telemedicine_fee": telemedicineFee,
    "chat_fee": chatFee,
    "start_time": startTime,
    "end_time": endTime,
    "clinic_id": clinicId,
    "image": image,
    "specialist_id": specialistId,
    "status": status,
    "clinic": clinic?.toMap(),
    "specialist": specialist?.toMap(),
  };
}

class Clinic {
  final int? id;
  final String? name;
  final String? address;
  final String? phone;
  final String? email;
  final String? openTime;
  final String? closeTime;
  final String? website;
  final String? note;
  final String? image;
  final String? spesialis;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Clinic({
    this.id,
    this.name,
    this.address,
    this.phone,
    this.email,
    this.openTime,
    this.closeTime,
    this.website,
    this.note,
    this.image,
    this.spesialis,
    this.createdAt,
    this.updatedAt,
  });

  factory Clinic.fromJson(String str) => Clinic.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Clinic.fromMap(Map<String, dynamic> json) => Clinic(
    id: json["id"],
    name: json["name"],
    address: json["address"],
    phone: json["phone"],
    email: json["email"],
    openTime: json["open_time"],
    closeTime: json["close_time"],
    website: json["website"],
    note: json["note"],
    image: json["image"],
    spesialis: json["spesialis"],
    createdAt: json["created_at"] == null
        ? null
        : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null
        ? null
        : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "address": address,
    "phone": phone,
    "email": email,
    "open_time": openTime,
    "close_time": closeTime,
    "website": website,
    "note": note,
    "image": image,
    "spesialis": spesialis,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}

class Specialist {
  final int? id;
  final String? name;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Specialist({
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
  });

  factory Specialist.fromJson(String str) =>
      Specialist.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Specialist.fromMap(Map<String, dynamic> json) => Specialist(
    id: json["id"],
    name: json["name"],
    createdAt: json["created_at"] == null
        ? null
        : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null
        ? null
        : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
