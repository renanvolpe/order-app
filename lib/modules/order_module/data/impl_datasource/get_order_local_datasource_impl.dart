import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';

import '../../../core/utils/failure.dart';
import '../../../hive_module/order_adapter.dart';
import '../../domain/model/order/order_model.dart';
import '../abstract_datasource/abstract_order_datasource.dart';

class GetOrderLocalDatasourceImpl implements IOrderDatasource {
  late LazyBox box;

  GetOrderLocalDatasourceImpl() {
    _openBox();
  }

  _openBox() async {
    //TODO REMOVE THIS FROM HERE AND SPLIT LIKE DIOSERVICE
    Hive.registerAdapter(PaymentAdapter());
    Hive.registerAdapter(ClienteModelAdapter());
    Hive.registerAdapter(ItemModelAdapter());
    Hive.registerAdapter(AddressOrderModelAdapter());
    Hive.registerAdapter(OrderAdapter());
    box = await Hive.openLazyBox<OrderModel>("orders");
  }

  @override
  Future<Either<Failure, List<OrderModel>>> getListOrders() async {
    List<OrderModel> listOrder = [];
    try {
      for (var id in box.keys) {
        var order = await box.get(id);

        listOrder.add(order);
      }
    } catch (e) {
      return const Left(ServerFailure());
    }
    return Right(listOrder);
  }

  @override
  Future<bool> saveOrder(List<OrderModel> listOrders) async {
    try {
      for (var e in listOrders) {
        await box.put(e.id, e); // add in hive
      }
    } catch (e) {
      return false;
    }
    return true;
  }
}
