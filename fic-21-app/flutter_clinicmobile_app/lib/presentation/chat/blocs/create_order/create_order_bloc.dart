import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_clinicmobile_app/data/datasources/order_remote_datasource.dart';
import 'package:flutter_clinicmobile_app/data/models/response/create_order_response_model.dart';
import 'package:flutter_clinicmobile_app/data/models/request/order_request_model.dart';

part 'create_order_event.dart';
part 'create_order_state.dart';
part 'create_order_bloc.freezed.dart';

class CreateOrderBloc extends Bloc<CreateOrderEvent, CreateOrderState> {
  final OrderRemoteDatasource datasource;

  CreateOrderBloc(this.datasource) : super(const _Initial()) {
    on<_CreateOrder>((event, emit) async {
      final result = await datasource.createOrder(event.model);
      result.fold(
            (l) => emit(_Error(l)),
            (r) => emit(_Success(r)),
      );
    });
  }
}
