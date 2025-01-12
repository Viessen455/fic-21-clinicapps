part of 'get_specialations_bloc.dart';

@freezed
class GetSpecialationsEvent with _$GetSpecialationsEvent {
  const factory GetSpecialationsEvent.started() = _Started;
  const factory GetSpecialationsEvent.getSpecialations() = _GetSpecialations;
}
