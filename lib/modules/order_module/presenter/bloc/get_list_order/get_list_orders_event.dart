// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'get_list_orders_bloc.dart';

sealed class GetListOrdersEvent {}

class GetListOrdersStarted extends GetListOrdersEvent {}

class FilteristOrdersStarted extends GetListOrdersEvent {
  final String name;
  FilteristOrdersStarted({
    required this.name,
  });
}

class SelectOrderStarted extends GetListOrdersEvent {
  final String id;
  SelectOrderStarted({
    required this.id,
  });
}
