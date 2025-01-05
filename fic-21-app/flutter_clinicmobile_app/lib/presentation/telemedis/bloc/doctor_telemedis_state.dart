part of 'doctor_telemedis_bloc.dart';

@freezed
class DoctorTelemedisState with _$DoctorTelemedisState {
  const factory DoctorTelemedisState.initial() = _Initial;

  const factory DoctorTelemedisState.loading() = _Loading;
  const factory DoctorTelemedisState.loaded(List<User> doctors) = _Loaded;
  const factory DoctorTelemedisState.error(String message) = _Error;
}

