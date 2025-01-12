import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_clinicmobile_app/data/datasources/auth_remote_datasource.dart';

part 'logout_event.dart';
part 'logout_state.dart';
part 'logout_bloc.freezed.dart';

class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  final AuthRemoteDatasource datasource;

  LogoutBloc(this.datasource) : super(const LogoutState.initial()) {
    on<_Logout>((event, emit) async {
      emit(const _Loading());
      final result = await datasource.logout();
      result.fold((l) {
        emit(_Error(l));
      }, (r) {
        emit(_Success(r));
      });
    });
  }
}
