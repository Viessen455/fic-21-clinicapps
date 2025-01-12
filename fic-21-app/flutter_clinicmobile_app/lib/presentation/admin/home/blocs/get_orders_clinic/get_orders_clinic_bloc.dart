import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_clinicmobile_app/data/datasources/order_remote_datasource.dart';
import 'package:flutter_clinicmobile_app/data/models/response/order_response_model.dart';

part 'get_orders_clinic_event.dart';
part 'get_orders_clinic_state.dart';
part 'get_orders_clinic_bloc.freezed.dart';

class GetOrdersClinicBloc
    extends Bloc<GetOrdersClinicEvent, GetOrdersClinicState> {
  final OrderRemoteDatasource datasource;

  GetOrdersClinicBloc(this.datasource)
      : super(const GetOrdersClinicState.initial()) {
    on<_GetOrders>((event, emit) async {
      emit(const _Loading());
      final result = await datasource.getOrdersByClinic();
      result.fold((l) {
        emit(_Error(l));
      }, (r) {
        emit(_Success(r));
      });
    });
  }
}