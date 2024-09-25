import 'package:flutter_modular/flutter_modular.dart';

import '../order_module/order_module.dart';
import '../report_module/report_module.dart';
import 'presenter/screen/home_page.dart';

class HomeModule extends Module {
  @override
  void routes(RouteManager r) {
    super.routes(r);

    r.child('/', child: (_) => const HomePage());
    r.module('/order', module: OrderModule());
    r.module('/report', module: ReportModule());
  }
  
}
