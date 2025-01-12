part of 'get_specialations_bloc.dart';

@freezed
class GetSpecialationsState with _$GetSpecialationsState {
  const factory GetSpecialationsState.initial() = _Initial;
  const factory GetSpecialationsState.loading() = _Loading;
  const factory GetSpecialationsState.error(String message) = _Error;
  const factory GetSpecialationsState.success(SpecialationResponseModel data) =
  _Success;
}
