import 'dart:convert';

class SpecialationResponseModel {
  final String status;
  final List<SpecialationModel> data;

  SpecialationResponseModel(this.status, this.data);

  Map<String, dynamic> toMap() {
    return {
      'status': status,
      'data': data.map((x) => x.toMap()).toList(),
    };
  }

  factory SpecialationResponseModel.fromMap(Map<String, dynamic> map) {
    return SpecialationResponseModel(
      map['status'] ?? '',
      List<SpecialationModel>.from(
          map['data']?.map((x) => SpecialationModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory SpecialationResponseModel.fromJson(String source) =>
      SpecialationResponseModel.fromMap(json.decode(source));
}

class SpecialationModel {
  final int id;
  final String name;

  SpecialationModel({
    required this.id,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  factory SpecialationModel.fromMap(Map<String, dynamic> map) {
    return SpecialationModel(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory SpecialationModel.fromJson(String source) =>
      SpecialationModel.fromMap(json.decode(source));
}
