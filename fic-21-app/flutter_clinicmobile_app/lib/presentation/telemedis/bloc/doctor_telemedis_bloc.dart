import 'package:bloc/bloc.dart';
import 'package:flutter_clinicmobile_app/data/datasources/doctor_remote_datasource.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../data/models/doctor_response_model.dart';


part 'doctor_telemedis_event.dart';
part 'doctor_telemedis_state.dart';
part 'doctor_telemedis_bloc.freezed.dart';

class DoctorTelemedisBloc extends Bloc<DoctorTelemedisEvent, DoctorTelemedisState> {
  final DoctorRemoteDataSource doctorRemoteDataSource;
  DoctorTelemedisBloc(
      this.doctorRemoteDataSource,
      ) : super(_Initial()) {
    on<_GetDoctorTelemedis>((event, emit) async {
      emit(const _Loading());
      final result = await doctorRemoteDataSource.getDoctorTelemedis();
      result.fold(
          (l) => emit(_Error(l)),
          (r) => emit(_Loaded(r.data ?? [])),
      );
    });
  }
}
