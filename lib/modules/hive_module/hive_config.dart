// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

import '../order_module/domain/model/order/order_model.dart';
import 'order_adapter.dart';

class HiveConfig {
  late LazyBox<OrderModel> box;

  Future<void> init() async {
    Directory dir = await getApplicationDocumentsDirectory();
    await Hive.initFlutter(dir.path);

    box = await _openBox();
  }

  _openBox() async {
    Hive.registerAdapter(PaymentAdapter());
    Hive.registerAdapter(ClienteModelAdapter());
    Hive.registerAdapter(ItemModelAdapter());
    Hive.registerAdapter(AddressOrderModelAdapter());
    Hive.registerAdapter(OrderAdapter());
    box = await Hive.openLazyBox<OrderModel>("orders");
    return box;
  }
}
