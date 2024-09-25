import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gap/gap.dart';

import '../../../core/style/app_color.dart';
import '../../../core/style/text_style.dart';
import '../../../core/utils/date_intl.dart';
import '../bloc/get_list_order/get_list_orders_bloc.dart';

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
                  (GetListOrdersProgress()) => const Text("progress"),
                  (GetListOrdersInitial()) => const Text("initial"),
                  (GetListOrdersSuccess()) => ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      separatorBuilder: (_, i) => const Gap(10),
                      shrinkWrap: true,
                      itemCount: state.listOrders.length,
                      itemBuilder: (_, i) {
                        var list = state.listOrders;
                        return ListTile(
                          onTap: () {
                            getListOrdersBloc.add(SelectOrderStarted(id: list[i].id));
                            Scaffold.of(context).openEndDrawer();
                            // showDialogDetailsOrder(context, list, i)
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

Future<dynamic> showDialogDetailsOrder(BuildContext context) {
  return showDialog(
      context: context,
      builder: (_) => AlertDialog(
            title: const Text("Detalhes do pedido"),
            content: BlocBuilder<GetListOrdersBloc, GetListOrdersState>(
              bloc: Modular.get<GetListOrdersBloc>(),
              builder: (context, state) {
                if (state is GetListOrdersSuccess) {
                  var order = state.orderSelected!;
                  return SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.8,
                    width: MediaQuery.sizeOf(context).width * 0.8,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Row(
                            children: [
                              Expanded(flex: 3, child: Text("PRODUTO")),
                              Expanded(flex: 1, child: Text("QTD")),
                              Expanded(flex: 2, child: Text("VALOR UNIT.")),
                            ],
                          ),
                          const Gap(10),
                          ListView.builder(
                              shrinkWrap: true,
                              itemCount: order.itens.length,
                              itemBuilder: (_, index) {
                                var item = order.itens[index];
                                return Row(
                                  children: [
                                    Expanded(flex: 3, child: Text(item.nome)),
                                    Expanded(flex: 1, child: Text(item.quantidade.toString())),
                                    Expanded(flex: 2, child: Text(item.valorUnitario.toString())),
                                  ],
                                );
                              }),
                          const Gap(60),
                          const Row(
                            children: [
                              Expanded(flex: 3, child: Text("PAGAMENTO")),
                              Expanded(flex: 2, child: Text("PARCELA")),
                              Expanded(flex: 2, child: Text("VALOR")),
                            ],
                          ),
                          const Gap(10),
                          ListView.builder(
                              shrinkWrap: true,
                              itemCount: order.pagamento.length,
                              itemBuilder: (_, index) {
                                var pag = order.pagamento[index];
                                return Row(
                                  children: [
                                    Expanded(flex: 3, child: Text(pag.nome)),
                                    Expanded(flex: 2, child: Text(pag.parcela.toString())),
                                    Expanded(flex: 2, child: Text(pag.valor.toString())),
                                  ],
                                );
                              }),
                        ],
                      ),
                    ),
                  );
                }
                return const SizedBox();
              },
            ),
          ));
}

class DrawerOrderDetail extends StatelessWidget {
  const DrawerOrderDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: BlocBuilder<GetListOrdersBloc, GetListOrdersState>(
      bloc: Modular.get<GetListOrdersBloc>(),
      builder: (context, state) {
        if (state is GetListOrdersSuccess) {
          var order = state.orderSelected!;
          return SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Detalhes do pedido", style: Style.defaultStyle.copyWith(fontSize: 24)),
                    const Gap(30),
                    Text(
                      "Informações do pedido",
                      style: Style.primaryStyle.copyWith(fontSize: 18),
                    ),
                    const Gap(10),
                    Text("Numero: ${order.id}", style: Style.darkStyle.copyWith(fontSize: 14)),
                    Text("Data Criação: ${DateIntl.stringToDateHome(order.dataCriacao)}",
                        style: Style.darkStyle.copyWith(fontSize: 14)),
                    Text("Data Alteração: ${DateIntl.stringToDateHome(order.dataAlteracao)}",
                        style: Style.darkStyle.copyWith(fontSize: 14)),
                    Text("Status: ${order.status}", style: Style.darkStyle.copyWith(fontSize: 14)),
                    Text("Desconto: ${order.desconto}", style: Style.darkStyle.copyWith(fontSize: 14)),
                    Text("Frete: ${order.frete}", style: Style.darkStyle.copyWith(fontSize: 14)),
                    Text("SubTotal: ${order.subTotal}", style: Style.darkStyle.copyWith(fontSize: 14)),
                    Text("total: ${order.valorTotal}", style: Style.darkStyle.copyWith(fontSize: 14)),
                    const Gap(10),
                    Text(
                      "Dados do Cliente",
                      style: Style.primaryStyle.copyWith(fontSize: 18),
                    ),
                    const Gap(10),
                    Text("Cliente: ${order.cliente.nome}", style: Style.darkStyle.copyWith(fontSize: 14)),
                    Text("Documento: ${order.cliente.cnpj}", style: Style.darkStyle.copyWith(fontSize: 14)),
                    Text("Data de nascimento: ${DateIntl.stringToDateHome(order.cliente.dataNascimento)}",
                        style: Style.darkStyle.copyWith(fontSize: 14)),
                    Text("E-mail: ${order.cliente.email}", style: Style.darkStyle.copyWith(fontSize: 14)),
                    const Gap(10),
                    Text(
                      "Local de Entrega",
                      style: Style.primaryStyle.copyWith(fontSize: 18),
                    ),
                    const Gap(10),
                    Text("Endereço: ${order.enderecoEntrega.endereco}", style: Style.darkStyle.copyWith(fontSize: 14)),
                    Text("Numero: ${order.enderecoEntrega.numero}", style: Style.darkStyle.copyWith(fontSize: 14)),
                    Text("CEP: ${order.enderecoEntrega.cep}", style: Style.darkStyle.copyWith(fontSize: 14)),
                    Text("Bairro: ${order.enderecoEntrega.bairro}", style: Style.darkStyle.copyWith(fontSize: 14)),
                    Text("Cidade: ${order.enderecoEntrega.cidade}", style: Style.darkStyle.copyWith(fontSize: 14)),
                    Text("Estado: ${order.enderecoEntrega.estado}", style: Style.darkStyle.copyWith(fontSize: 14)),
                    Text("Complemento: ${order.enderecoEntrega.complemento}",
                        style: Style.darkStyle.copyWith(fontSize: 14)),
                    Text("Referencia: ${order.enderecoEntrega.referencia}",
                        style: Style.darkStyle.copyWith(fontSize: 14)),
                    const Gap(40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            GestureDetector(
                                onDoubleTap: () => showDialogDetailsOrder(context),
                                child: Text(
                                  "Detalhar",
                                  style: Style.defaultStyle.copyWith(fontSize: 20, fontWeight: FontWeight.w600),
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.clip,
                                )),
                            Text("(Clique duas vezes para detalhar)", style: Style.greyStyle.copyWith(fontSize: 13))
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        }
        return const SizedBox();
      },
    ));
  }
}
