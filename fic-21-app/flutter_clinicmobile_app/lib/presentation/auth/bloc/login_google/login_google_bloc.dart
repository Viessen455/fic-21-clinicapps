import 'package:bloc/bloc.dart';
import 'package:flutter_clinicmobile_app/data/datasources/auth_remote_datasource.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_google_event.dart';
part 'login_google_state.dart';
part 'login_google_bloc.freezed.dart';

class LoginGoogleBloc extends Bloc<LoginGoogleEvent, LoginGoogleState> {
  final AuthRemoteDataSource _authRemoteDataSource;
  LoginGoogleBloc(
      this._authRemoteDataSource,
      ) : super(_Initial()) {
    on<_LoginGoogle>((event, emit) async{
      emit(_Loading());
      final result = await _authRemoteDataSource.loginGoogle(event.idToken);
      result != null
          ? emit (_Success(result))
          : emit (_Error("Failed to Login With Google"));
    });
  }
}
