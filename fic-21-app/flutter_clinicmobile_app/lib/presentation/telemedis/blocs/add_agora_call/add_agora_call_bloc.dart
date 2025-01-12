import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_clinicmobile_app/data/datasources/agora_remote_datasource.dart';
import 'package:flutter_clinicmobile_app/data/models/request/agora_request_model.dart';
part 'add_agora_call_event.dart';
part 'add_agora_call_state.dart';
part 'add_agora_call_bloc.freezed.dart';

class AddAgoraCallBloc extends Bloc<AddAgoraCallEvent, AddAgoraCallState> {
  final AgoraRemoteDatasource datasource;

  AddAgoraCallBloc(this.datasource) : super(const AddAgoraCallState.initial()) {
    on<_AddAgoraCall>((event, emit) async {
      emit(const _Loading());
      final result = await datasource.addAgoraCall(event.model);
      result.fold(
            (l) {
          emit(_Error(l));
        },
            (r) {
          emit(_Success(r));
        },
      );
    });
  }
}
