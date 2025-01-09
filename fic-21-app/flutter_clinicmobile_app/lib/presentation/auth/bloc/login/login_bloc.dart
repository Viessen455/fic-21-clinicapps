import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../data/models/response/login_response_model.dart';
import 'package:flutter_clinicmobile_app/data/datasources/auth_remote_datasource.dart';
part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRemoteDatasource datasource;

  LoginBloc(this.datasource) : super(const LoginState.initial()) {
    on<_Login>((event, emit) async {
      emit(const _Loading());
      final result = await datasource.login(event.email, event.password);
      result.fold((l) => emit(_Error(l)), (r) => emit(_Success(r)));
    });
  }
}

