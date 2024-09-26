import 'package:flutter_modular/flutter_modular.dart';
import 'package:order_app/modules/order_module/presenter/bloc/get_list_order/get_list_orders_bloc.dart';
import 'package:order_app/modules/shared/shared_mdoule.dart';

import 'data/impl_datasource/get_order_local_datasource_impl.dart';
import 'data/impl_datasource/get_order_remote_datasource_impl.dart';
import 'data/order_repository.dart';
import 'domain/usecases/get_orders_usecase.dart';
import 'presenter/screen/order_page.dart';

class OrderModule extends Module {
  @override
  void binds(Injector i) {
    i.addSingleton(GetOrderRemoteDatasourceImpl.new);
    i.addSingleton(GetOrderLocalDatasourceImpl.new);
    i.addSingleton(OrderRepositoryImpl.new);
    i.addSingleton(GetOrdersUsecase.new);
    i.addSingleton(GetListOrdersBloc.new);

    super.binds(i);
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (_) => const OrderPage());
    super.routes(r);
  }

  @override
  List<Module> get imports => [SharedModule()];
}
