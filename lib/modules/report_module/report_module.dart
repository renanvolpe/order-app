import 'package:flutter_modular/flutter_modular.dart';
import 'package:order_app/modules/order_module/order_module.dart';

import 'presenter/screen/report_page.dart';
import 'presenter/widget/cubit/calculate_reports_cubit.dart';

class ReportModule extends Module {
  @override
  void routes(RouteManager r) {
    super.routes(r);
    r.child('/', child: (_) => const ReportPage());
  }

  @override
  void binds(Injector i) {
    i.addSingleton(CalculateReportsCubit.new);
    super.binds(i);
  }

  @override
  List<Module> get imports => [OrderModule()];
}
