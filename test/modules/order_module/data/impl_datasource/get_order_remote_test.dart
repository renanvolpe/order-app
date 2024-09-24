import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_test/hive_test.dart';
import 'package:order_app/modules/order_module/data/abstract_datasource/abstract_order_datasource.dart';
import 'package:order_app/modules/order_module/data/impl_datasource/get_order_local_datasource_impl.dart';
import 'package:order_app/modules/order_module/data/impl_datasource/get_order_remote_datasource_impl.dart';
import 'package:order_app/modules/order_module/domain/model/order/order_model.dart';
import 'package:order_app/modules/shared/dio/dio_service.dart';

void main() {
  late IOrderDatasource remoteDatasource;
  late IOrderDatasource localDatasource;

  setUpAll(() async {
    remoteDatasource = GetOrderRemoteDatasourceImpl(DioClient(Dio()));
    await setUpTestHive();
    // TestWidgetsFlutterBinding.ensureInitialized();
    // await HiveConfig.start();
    localDatasource = GetOrderLocalDatasourceImpl();
  });
  tearDownAll(() async {
    await tearDownTestHive();
  });
  group("Test one endpoints to get order from api", () {
    late List<OrderModel> listOrder;
    test("test order from api with success", () async {
      var response = await remoteDatasource.getListOrders();
      expect(response, isA<Right>());

      response.fold((failure) {}, (success) {
        listOrder = success;
        expect(success, isA<List<OrderModel>>());
      });
    });

    test("Test save hive list order", () async {
      var response = await localDatasource.saveOrder(listOrder);
      expect(response, true);
    });

    test("Test get hive list order", () async {
      var response = await localDatasource.getListOrders();
      expect(response, isA<List<OrderModel>>());
    });
  });
}
