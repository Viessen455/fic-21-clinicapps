import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_clinicmobile_app/data/datasources/user_remote_datasource.dart';
import 'package:flutter_clinicmobile_app/data/models/response/login_response_model.dart';

part 'update_google_id_event.dart';
part 'update_google_id_state.dart';
part 'update_google_id_bloc.freezed.dart';

class UpdateGoogleIdBloc
    extends Bloc<UpdateGoogleIdEvent, UpdateGoogleIdState> {
  final UserRemoteDatasource datasource;

  UpdateGoogleIdBloc(this.datasource)
      : super(const UpdateGoogleIdState.initial()) {
    on<_UpdateGoogleId>((event, emit) async {
      emit(const _Loading());
      // final result = await datasource.updateGoogleId(
      //   event.googleId,
      //   event.id,
      // );
      // result.fold((l) => emit(_Error(l)), (r) => emit(_Success(r)));
    });
  }
}
