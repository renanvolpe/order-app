// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gap/gap.dart';

import '../../../core/style/app_color.dart';
import '../../../core/style/text_style.dart';
import '../../../core/utils/date_intl.dart';
import '../../../home_module/presenter/screen/home_page.dart';
import '../../domain/model/order/order_model.dart';
import '../bloc/get_list_order/get_list_orders_bloc.dart';
import '../widget/drawer_order_detail.dart';

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  late TextEditingController nameController;
  late GetListOrdersBloc getListOrdersBloc;

  @override
  void initState() {
    nameController = TextEditingController();

    getListOrdersBloc = Modular.get<GetListOrdersBloc>();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerMenu(),
      endDrawerEnableOpenDragGesture: false,
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () => Modular.to.pop(), child: const Icon(Icons.chevron_left, color: AppColor.kPrimary)),
        title: Text("PEDIDOS STI3", style: Style.defaultStyle),
        actions: const [SizedBox()],
      ),
      endDrawer: const DrawerOrderDetail(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () {
                      getListOrdersBloc.add(GetListOrdersStarted());
                    },
                    child: Text("CONSULTAR", textAlign: TextAlign.center, style: Style.darkStyle)),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                  controller: nameController,
                  decoration: const InputDecoration(hintText: "Pesquise pelo nome do Cliente")),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () {
                      getListOrdersBloc.add(FilteristOrdersStarted(name: nameController.text));
                    },
                    child: Text("Filtrar", textAlign: TextAlign.center, style: Style.darkStyle)),
              ],
            ),
            BlocBuilder<GetListOrdersBloc, GetListOrdersState>(
              bloc: getListOrdersBloc,
              builder: (context, state) {
                return switch (state) {
                  (GetListOrdersFailure()) => const Text("failure"),
                  (GetListOrdersProgress()) => const Center(child: CircularProgressIndicator()),
                  (GetListOrdersInitial()) => const Center(child: Text("Clique em Consultar para iniciar a lsita")),
                  (GetListOrdersSuccess()) => ShowListOrderWidget(
                      getListOrdersBloc: getListOrdersBloc,
                      list: state.listOrders,
                    ),
                };
              },
            )
          ],
        ),
      ),
    );
  }
}

class ShowListOrderWidget extends StatelessWidget {
  const ShowListOrderWidget({
    super.key,
    required this.getListOrdersBloc,
    required this.list,
  });

  final GetListOrdersBloc getListOrdersBloc;
  final List<OrderModel> list;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (_, i) => const Gap(10),
      shrinkWrap: true,
      itemCount: list.length,
      itemBuilder: (_, i) {
        return ListTile(
          onTap: () {
            getListOrdersBloc.add(SelectOrderStarted(id: list[i].id));
            Scaffold.of(context).openEndDrawer();
          },
          isThreeLine: true,
          title: Row(
            children: [
              Text(
                " $i - Cliente: ${list[i].cliente.nome}",
                overflow: TextOverflow.ellipsis,
                style: Style.darkStyle.copyWith(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const Gap(10),
            ],
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Data Criação:  ${DateIntl.stringToDateHome(list[i].dataCriacao)}",
                style: Style.darkStyle.copyWith(fontSize: 13),
              ),
              const Gap(2),
              Text(
                "Status  ${list[i].status}",
                style: Style.darkStyle.copyWith(fontSize: 13),
              ),
            ],
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Valor Total: ",
                style: Style.darkStyle.copyWith(fontSize: 13),
              ),
              Text(
                "${list[i].valorTotal}",
                style: Style.darkStyle.copyWith(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        );
      },
    );
  }
}
