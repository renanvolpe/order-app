import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gap/gap.dart';
import 'package:order_app/modules/order_module/presenter/bloc/get_list_order/get_list_orders_bloc.dart';

import '../../../core/style/app_color.dart';
import '../../../core/style/text_style.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  late GetListOrdersBloc getListOrdersBloc;
  @override
  void initState() {
    getListOrdersBloc = Modular.get<GetListOrdersBloc>();
    getListOrdersBloc.add(GetListOrdersStarted());
    super.initState();
  }

  List<DropdownMenuEntry> dropdownMenuEntries = [
    const DropdownMenuEntry(label: "Selecione o tipo de relatório", value: "0"),
    const DropdownMenuEntry(label: "Listagem de produtos mais Vendidos", value: "1"),
    const DropdownMenuEntry(label: "Total Formas pagamento por dia", value: "2"),
    const DropdownMenuEntry(label: "Total venda por cidade", value: "3"),
    const DropdownMenuEntry(label: "Total de Vendas por Faixa Etária", value: "4"),
  ];

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Report Page", textAlign: TextAlign.center, style: Style.greyStyle),
        leading: GestureDetector(
            onTap: () => Modular.to.pop(), child: const Icon(Icons.chevron_left, color: AppColor.kPrimary)),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Gap(20),
            BlocBuilder<GetListOrdersBloc, GetListOrdersState>(
              bloc: getListOrdersBloc,
              builder: (context, state) {
                return switch (state) {
                  (GetListOrdersFailure()) => const Text("failure"),
                  (GetListOrdersProgress()) => const Center(child: CircularProgressIndicator()),
                  (GetListOrdersInitial()) => const Center(child: Text("Clique em Consultar para iniciar a lsita")),
                  (GetListOrdersSuccess()) => Column(
                      children: [DropdownMenu(dropdownMenuEntries: dropdownMenuEntries)],
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
