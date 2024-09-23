import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:order_app/modules/order_module/data/abstract_datasource/abstract_order_datasource.dart';
import 'package:order_app/modules/order_module/data/impl_datasource/get_order_remote_datasource_impl.dart';
import 'package:order_app/modules/order_module/domain/model/order/order_model.dart';
import 'package:order_app/shared/dio/dio_service.dart';

void main() {
  late IOrderDatasource datasource;

  setUpAll(() {
    datasource = GetOrderRemoteDatasourcecImpl(DioClient(Dio()));
  });
  tearDownAll(() {});
  group("Test one endpoints to get order from api", () {
    test("test order from api with success", () async {
      var response = await datasource.getOrder();
      expect(response, isA<Right>());

      response.fold((failure) {}, (success) {
        expect(success, isA<List<OrderModel>>());
      });
    });
  });
}
