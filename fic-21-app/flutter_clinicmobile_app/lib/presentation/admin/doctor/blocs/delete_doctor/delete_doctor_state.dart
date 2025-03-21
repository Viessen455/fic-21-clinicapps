part of 'delete_doctor_bloc.dart';

@freezed
class DeleteDoctorState with _$DeleteDoctorState {
  const factory DeleteDoctorState.initial() = _Initial;
  const factory DeleteDoctorState.loading() = _Loading;
  const factory DeleteDoctorState.error(String message) = _Error;
  const factory DeleteDoctorState.success(String message) = _Success;
}
