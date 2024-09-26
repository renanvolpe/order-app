
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gap/gap.dart';

import '../../../core/style/text_style.dart';
import '../../../core/utils/date_intl.dart';
import '../bloc/get_list_order/get_list_orders_bloc.dart';
import 'show_dialog_detail_order.dart';


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