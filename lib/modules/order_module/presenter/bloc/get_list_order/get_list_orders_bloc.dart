import 'package:bloc/bloc.dart';
import 'package:order_app/modules/core/utils/abstract_usecase.dart';
import 'package:order_app/modules/order_module/domain/model/order/order_model.dart';
import 'package:order_app/modules/order_module/domain/usecases/get_orders_usecase.dart';

part 'get_list_orders_event.dart';
part 'get_list_orders_state.dart';

class GetListOrdersBloc extends Bloc<GetListOrdersEvent, GetListOrdersState> {
  List<OrderModel> _listOrders = [];
  OrderModel? _orderSelected;

  //GET LIST OF ORDERS FROM API AND LOCAL
  GetListOrdersBloc(GetOrdersUsecase usecase) : super(GetListOrdersInitial()) {
    on<GetListOrdersStarted>((event, emit) async {
      emit(GetListOrdersProgress());
      var response = await usecase.call(NoParam());
      response.fold(
        (failure) => emit(GetListOrdersFailure(failure.message!)),
        (success) {
          _listOrders.clear(); // to restart every time the clients
          _listOrders = success;
          emit(GetListOrdersSuccess(listOrders: success, orderSelected: _orderSelected));
        },
      );
    });

    //FILTER THE NAME OF ORDER BY CLIENT
    on<FilteristOrdersStarted>((event, emit) async {
      if (event.name.isEmpty) {
        emit(GetListOrdersProgress());
        emit(GetListOrdersSuccess(listOrders: _listOrders, orderSelected: _orderSelected));
      } else {
        String trimmedName = event.name.trim().toLowerCase();
        List<OrderModel> newList = _listOrders.where((order) {
          return order.cliente.nome.toLowerCase().contains(trimmedName);
        }).toList();
        emit(GetListOrdersSuccess(listOrders: newList, orderSelected: _orderSelected));
      }
    });

    //SELECT A ORDER THE WILL THE DETAILED
    on<SelectOrderStarted>((event, emit) async {
      var newOrderSelected = _listOrders.firstWhere((order) => order.id == event.id);
      emit(GetListOrdersSuccess(listOrders: _listOrders, orderSelected: newOrderSelected));
    });
  }
}
