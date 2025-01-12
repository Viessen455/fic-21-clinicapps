import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_clinicmobile_app/data/models/response/doctor_response_model.dart';
import 'package:flutter_clinicmobile_app/data/datasources/doctor_remote_datasource.dart';

part 'get_doctors_active_event.dart';
part 'get_doctors_active_state.dart';
part 'get_doctors_active_bloc.freezed.dart';

class GetDoctorsActiveBloc
    extends Bloc<GetDoctorsActiveEvent, GetDoctorsActiveState> {
  final DoctorRemoteDatasource datasource;
  List<DoctorModel> doctors = [];
  GetDoctorsActiveBloc(this.datasource)
      : super(const GetDoctorsActiveState.initial()) {
    on<_GetDoctors>((event, emit) async {
      emit(const _Loading());
      final result = await datasource.getDoctorsActive();
      result.fold(
            (l) => emit(GetDoctorsActiveState.error(l)),
            (r) {
          doctors = r.data!;
          emit(GetDoctorsActiveState.success(r.data!));
        },
      );
    });

    on<_SearchDoctors>((event, emit) async {
      emit(const _Loading());
      final newDoctors = doctors
          .where(
            (element) =>
        element.name!
            .toLowerCase()
            .contains(event.query.toLowerCase()) ||
            element.specialation!.name
                .toLowerCase()
                .contains(event.query.toLowerCase()),
      )
          .toList();
      emit(_Success(newDoctors));
    });

    on<_SpealicationDoctor>((event, emit) async {
      emit(const _Loading());
      if (event.id == 0) {
        emit(GetDoctorsActiveState.success(doctors));
      } else {
        final newDoctors = doctors
            .where((element) => element.specialation!.id == event.id)
            .toList();
        emit(_Success(newDoctors));
      }
    });

    on<_FetchAllFromState>((event, emit) async {
      emit(const _Loading());
      emit(GetDoctorsActiveState.success(doctors));
    });
  }
}