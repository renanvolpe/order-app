// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:order_app/shared/dio/dio_service.dart';

import '../../../../core/utils/endpoint.dart';
import '../../../../core/utils/failure.dart';
import '../../domain/model/order/order_model.dart';
import '../abstract_datasource/abstract_order_datasource.dart';

class GetOrderRemoteDatasourcecImpl implements IOrderDatasource {
  DioService dio;
  GetOrderRemoteDatasourcecImpl(
    this.dio,
  );
  @override
  Future<Either<Failure, List<OrderModel>>> getOrder() async {
    try {
    var response = await dio.dioGet(endpoint: Endpoint.order);
      return response.fold((failure) => Left(failure), (success) {
        List<OrderModel> listOrder = [];
        for (var element in success) {
          listOrder.add(OrderModel.fromMap(element));
        }
        return Right(listOrder);
      });
    } catch (e) {
      return const Left(UnexpectedFailure());
    }
  }
}
