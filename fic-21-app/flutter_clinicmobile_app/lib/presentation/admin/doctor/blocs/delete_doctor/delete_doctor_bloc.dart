import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_clinicmobile_app/data/datasources/doctor_remote_datasource.dart';

part 'delete_doctor_event.dart';
part 'delete_doctor_state.dart';
part 'delete_doctor_bloc.freezed.dart';
class DeleteDoctorBloc extends Bloc<DeleteDoctorEvent, DeleteDoctorState> {
  final DoctorRemoteDatasource datasource;

  DeleteDoctorBloc(this.datasource) : super(const DeleteDoctorState.initial()) {
    on<_DeleteDoctor>((event, emit) async {
      emit(const _Loading());
      final result = await datasource.deleteDoctor(event.id);
      result.fold(
            (l) => emit(
          _Error(l),
        ),
            (r) => emit(
          _Success(r),
        ),
      );
    });
  }
}