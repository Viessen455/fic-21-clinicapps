import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_clinicmobile_app/data/datasources/specialation_remote_datasource.dart';
import 'package:flutter_clinicmobile_app/data/models/response/specialation_response_model.dart';


part 'get_specialations_event.dart';
part 'get_specialations_state.dart';
part 'get_specialations_bloc.freezed.dart';

class GetSpecialationsBloc
    extends Bloc<GetSpecialationsEvent, GetSpecialationsState> {
  final SpecialationRemoteDatasource datasource;

  GetSpecialationsBloc(this.datasource)
      : super(const GetSpecialationsState.initial()) {
    on<_GetSpecialations>((event, emit) async {
      emit(const _Loading());
      final result = await datasource.getSpecialations();
      result.fold((l) => emit(GetSpecialationsState.error(l)),
              (r) => emit(_Success(r)));
    });
  }
}

