import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_clinicmobile_app/data/datasources/doctor_remote_datasource.dart';
import 'package:flutter_clinicmobile_app/data/models/request/doctor_request_model.dart';

part 'add_doctor_event.dart';
part 'add_doctor_state.dart';
part 'add_doctor_bloc.freezed.dart';

class AddDoctorBloc extends Bloc<AddDoctorEvent, AddDoctorState> {
  final DoctorRemoteDatasource datasource;

  AddDoctorBloc(this.datasource) : super(const AddDoctorState.initial()) {
    on<_AddDoctor>((event, emit) async {
      emit(const _Loading());
      final result = await datasource.addDoctor(event.model);
      result.fold(
            (l) => emit(_Error(l)),
            (r) => emit(_Success(r)),
      );
    });
  }
}
