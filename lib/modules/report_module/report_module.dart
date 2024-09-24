import 'package:flutter_modular/flutter_modular.dart';

import 'presenter/screen/order_page.dart';

class ReportModule extends Module {
  @override
  void routes(RouteManager r) {
    super.routes(r);
    r.child('/', child: (_) => const ReportPage());
  }
}
