// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:order_app/modules/order_module/data/impl_datasource/get_order_local_datasource_impl.dart';

import '../../core/utils/failure.dart';
import '../domain/model/order/order_model.dart';
import 'impl_datasource/get_order_remote_datasource_impl.dart';

abstract class IOrderRepository {
  getListOrdersLocal();
  getListOrdersRemote();
  postListOrderLocal(List<OrderModel> listOrders);
}

class OrderRepositoryImpl implements IOrderRepository {
  GetOrderLocalDatasourceImpl localDatasource;
  GetOrderRemoteDatasourceImpl remoteDatasource;

  OrderRepositoryImpl({
    required this.localDatasource,
    required this.remoteDatasource,
  });
  @override
  Future<Either<Failure, List<OrderModel>>> getListOrdersLocal() async {
    try {
      var response = await localDatasource.getListOrders();
      return response;
    } catch (e) {
      return const Left(UnexpectedFailure());
    }
  }

  @override
  Future<Either<Failure, List<OrderModel>>> getListOrdersRemote() async {
    try {
      var response = await remoteDatasource.getListOrders();
      return response;
    } catch (e) {
      return const Left(UnexpectedFailure());
    }
  }

  @override
  Future<bool> postListOrderLocal(List<OrderModel> listOrders) async {
    return await localDatasource.saveOrder(listOrders);
  }
}
