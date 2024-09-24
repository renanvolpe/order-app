import 'package:flutter_modular/flutter_modular.dart';

import '../app_service.dart';
import 'order_module/order_module.dart';
import 'report_module/report_module.dart';
import 'shared/shared_mdoule.dart';

class AppModule extends Module {
  @override
  void binds(Injector i) {
    i.addSingleton(AppService.new);
    super.binds(i);
  }

  @override
  void routes(RouteManager r) {
    r.module('/', module: OrderModule());
    r.module('/report', module: ReportModule());
    super.routes(r);
  }

  @override
  List<Module> get imports => [SharedModule()];
}
