part of 'doctor_telemedis_bloc.dart';

@freezed
class DoctorTelemedisEvent with _$DoctorTelemedisEvent {
  const factory DoctorTelemedisEvent.started() = _Started;

  const factory DoctorTelemedisEvent.getDoctorTelemedis() = _GetDoctorTelemedis;
}
