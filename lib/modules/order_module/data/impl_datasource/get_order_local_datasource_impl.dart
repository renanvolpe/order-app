import 'package:dartz/dartz.dart';

import '../../../core/utils/failure.dart';
import '../../../hive_module/hive_config.dart';
import '../../domain/model/order/order_model.dart';
import '../abstract_datasource/abstract_order_datasource.dart';

class GetOrderLocalDatasourceImpl implements IOrderDatasource {
  final HiveConfig hiveConfig;

  GetOrderLocalDatasourceImpl(this.hiveConfig);

  @override
  Future<Either<Failure, List<OrderModel>>> getListOrders() async {
    List<OrderModel> listOrder = [];

    try {
      for (var id in hiveConfig.box.keys) {
        var order = await hiveConfig.box.get(id);

        listOrder.add(order!);
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
        await hiveConfig.box.put(e.id, e); // add in hive
      }
    } catch (e) {
      return false;
    }
    return true;
  }
}
