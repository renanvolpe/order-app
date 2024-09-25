import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:order_app/modules/hive_module/hive_config.dart';

import 'dio/dio_service.dart';

class SharedModule extends Module {
  @override
  void exportedBinds(Injector i) {
    i.add(() => Dio());
    i.addSingleton<DioService>(DioClient.new);

    i.addSingleton(HiveConfig.new);//Start DB in main

    super.exportedBinds(i);
  }
}
