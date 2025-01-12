import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_clinicmobile_app/data/datasources/agora_remote_datasource.dart';
import 'package:flutter_clinicmobile_app/data/models/response/agora_response_model.dart';
part 'get_agor_calls_event.dart';
part 'get_agor_calls_state.dart';
part 'get_agor_calls_bloc.freezed.dart';

class GetAgorCallsBloc extends Bloc<GetAgorCallsEvent, GetAgorCallsState> {
  final AgoraRemoteDatasource datasource;

  GetAgorCallsBloc(this.datasource) : super(const GetAgorCallsState.initial()) {
    on<_GetAgorCalls>((event, emit) async {
      emit(const _Loading());
      final result = await datasource.getAgoraCalls();
      result.fold(
            (l) => emit(_Error(l)),
            (r) => emit(_Success(r)),
      );
    });
  }
}
