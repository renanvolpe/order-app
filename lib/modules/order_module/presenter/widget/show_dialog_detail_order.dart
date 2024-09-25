

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gap/gap.dart';

import '../bloc/get_list_order/get_list_orders_bloc.dart';

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
