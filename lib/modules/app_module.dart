import 'package:flutter_modular/flutter_modular.dart';

import '../app_service.dart';
import 'home_module/home_module.dart';
import 'shared/shared_mdoule.dart';

class AppModule extends Module {
  @override
  void binds(Injector i) {
    i.addSingleton(AppService.new);
    super.binds(i);
  }

  @override
  void routes(RouteManager r) {
    r.module('/', module: HomeModule());

    super.routes(r);
  }

  @override
  List<Module> get imports => [SharedModule()];
}
