import 'package:bloc/bloc.dart';
import 'package:order_app/modules/core/utils/abstract_usecase.dart';
import 'package:order_app/modules/order_module/domain/model/order/order_model.dart';
import 'package:order_app/modules/order_module/domain/usecases/get_orders_usecase.dart';

part 'get_list_orders_event.dart';
part 'get_list_orders_state.dart';

class GetListOrdersBloc extends Bloc<GetListOrdersEvent, GetListOrdersState> {
  List<OrderModel> listOrders = [];
  GetListOrdersBloc(GetOrdersUsecase usecase) : super(GetListOrdersInitial()) {
    on<GetListOrdersStarted>((event, emit) async {
      emit(GetListOrdersProgress());
      var response = await usecase.call(NoParam());
      response.fold(
        (failure) => emit(GetListOrdersFailure(failure.message!)),
        (success) {
          listOrders.clear(); // to restart every time the clients
          listOrders = success;
          emit(GetListOrdersSuccess(success));
        },
      );
    });

    on<FilteristOrdersStarted>((event, emit) async {
      if (event.name.isEmpty) {
        emit(GetListOrdersProgress());
        emit(GetListOrdersSuccess(listOrders));
      } else {
        String trimmedName = event.name.trim().toLowerCase();
        List<OrderModel> newList = listOrders.where((order) {
          return order.cliente.nome.toLowerCase().contains(trimmedName);
        }).toList();
        emit(GetListOrdersSuccess(newList));
      }
    });
  }
}
