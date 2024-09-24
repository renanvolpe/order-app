part of 'get_list_orders_bloc.dart';


sealed class GetListOrdersState {}

final class GetListOrdersInitial extends GetListOrdersState {}
final class GetListOrdersProgress extends GetListOrdersState {}
final class GetListOrdersSuccess extends GetListOrdersState {
  final List<OrderModel> listOrders;
  GetListOrdersSuccess(this.listOrders);
}
final class GetListOrdersFailure extends GetListOrdersState {
  final String message;
  GetListOrdersFailure(this.message);
}
