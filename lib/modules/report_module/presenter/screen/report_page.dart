import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gap/gap.dart';
import 'package:order_app/modules/core/utils/date_intl.dart';
import 'package:order_app/modules/order_module/presenter/bloc/get_list_order/get_list_orders_bloc.dart';

import '../../../core/style/app_color.dart';
import '../../../core/style/text_style.dart';
import '../widget/cubit/calculate_reports_cubit.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  late GetListOrdersBloc getListOrdersBloc;
  late CalculateReportsCubit calculateReportsCubit;
  @override
  void initState() {
    getListOrdersBloc = Modular.get<GetListOrdersBloc>();
    getListOrdersBloc.add(GetListOrdersStarted());

    calculateReportsCubit = Modular.get<CalculateReportsCubit>();
    super.initState();
  }

  List<DropdownMenuEntry> dropdownMenuEntries = [
    // const DropdownMenuEntry(label: "Selecione o tipo de relatório", value: "0"),
    const DropdownMenuEntry(label: "Listagem de produtos mais Vendidos", value: 1),
    const DropdownMenuEntry(label: "Total Formas pagamento por dia", value: 2),
    const DropdownMenuEntry(label: "Total venda por cidade", value: 3),
    const DropdownMenuEntry(label: "Total de Vendas por Faixa Etária", value: 4),
  ];
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Report Page", textAlign: TextAlign.center, style: Style.greyStyle),
        leading: GestureDetector(
            onTap: () => Modular.to.pop(), child: const Icon(Icons.chevron_left, color: AppColor.kPrimary)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Gap(20),
                BlocBuilder<GetListOrdersBloc, GetListOrdersState>(
                  bloc: getListOrdersBloc,
                  builder: (context, state) {
                    if (state is GetListOrdersSuccess) {
                      calculateReportsCubit.init(state.listOrders);
                    }
                    return switch (state) {
                      (GetListOrdersFailure()) => const Text("failure"),
                      (GetListOrdersProgress()) => const Center(child: CircularProgressIndicator()),
                      (GetListOrdersInitial()) => const Center(child: Text("Clique em Consultar para iniciar a lsita")),
                      (GetListOrdersSuccess()) => Column(
                          children: [
                            DropdownButton<String>(
                              value: selectedValue,
                              hint: const Text('Selecione o tipo de relatório'),
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedValue = newValue;
                                });
                              },
                              items: dropdownMenuEntries.map((DropdownMenuEntry entry) {
                                return DropdownMenuItem<String>(
                                  onTap: () {
                                    int number = entry.value;
                                    switch (number) {
                                      case 1:
                                        calculateReportsCubit.calculateMoreSold();
                                      case 2:
                                        calculateReportsCubit.calculatePaidByDay();
                                      case 3:
                                        calculateReportsCubit.calculateSoldByCity();
                                      case 4:
                                        calculateReportsCubit.calculateByAge();
                                      case _:
                                        {}
                                    }
                                  },
                                  value: entry.value.toString(),
                                  child: Text(entry.label),
                                );
                              }).toList(),
                            ),
                            const Gap(15),
                            BlocBuilder<CalculateReportsCubit, CalculateReportsState>(
                              bloc: calculateReportsCubit,
                              builder: (context, state) {
                                return switch (state) {
                                  (CalculateReportsInitial()) => const Text("Selecione uma lsitagem para filtrar"),
                                  (CalculateReportsMoreSold()) => Column(
                                      children: [
                                        const Row(
                                          children: [
                                            Expanded(flex: 2, child: Text("Produto")),
                                            Expanded(flex: 1, child: Text("Quantiade")),
                                            Expanded(flex: 1, child: Text("ValorMeida")),
                                          ],
                                        ),
                                        const Gap(20),
                                        for (int i = 0; i < state.listItem.length; i++)
                                          Row(
                                            children: [
                                              Expanded(flex: 2, child: Text(state.listItem[i].nome)),
                                              Expanded(flex: 1, child: Text(state.listItem[i].quantidade.toString())),
                                              Expanded(
                                                  flex: 1, child: Text(state.listItem[i].valorUnitario.toString())),
                                            ],
                                          ),
                                      ],
                                    ),
                                  (CalculateReportsPaidByDay()) => Column(
                                      children: [
                                        const Row(
                                          children: [
                                            Expanded(flex: 2, child: Text("Produto")),
                                            Expanded(flex: 1, child: Text("Quantiade")),
                                            Expanded(flex: 1, child: Text("Valor")),
                                          ],
                                        ),
                                        const Gap(20),
                                        for (int i = 0; i < state.newListOrderByDate.length; i++)
                                          Row(
                                            children: [
                                              Expanded(
                                                  flex: 2,
                                                  child: Text(DateIntl.stringToDateHome(
                                                      state.newListOrderByDate[i].dataCriacao))),
                                              Expanded(
                                                  flex: 1,
                                                  child: Column(
                                                    children: [
                                                      const Gap(10),
                                                      for (int x = 0;
                                                          x < state.newListOrderByDate[i].pagamento.length;
                                                          x++) ...[
                                                        Text(state.newListOrderByDate[i].pagamento[x].codigo),
                                                        const Gap(10)
                                                      ],
                                                    ],
                                                  )),
                                              Expanded(
                                                  flex: 1,
                                                  child: Text(state.newListOrderByDate[i].valorTotal.toString())),
                                            ],
                                          ),
                                      ],
                                    ),
                                  (CalculateReportsSoldByAge()) => Column(
                                      children: [
                                        const Row(
                                          children: [
                                            Expanded(flex: 2, child: Text("Faixa Etária")),
                                            Expanded(flex: 1, child: Text("Quantidade")),
                                          ],
                                        ),
                                        const Gap(20),
                                        Row(
                                          children: [
                                            Expanded(
                                              flex: 2,
                                              child: Text(
                                                "Idade menor ou igual a 30",
                                                style: Style.defaultStyle,
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Text(
                                                state.lesstEqualThan30.length.toString(),
                                                style: Style.defaultStyle,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              flex: 2,
                                              child: Text(
                                                "Idade maior que 30",
                                                style: Style.defaultStyle,
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Text(
                                                state.moreThan30.length.toString(),
                                                style: Style.defaultStyle,
                                              ),
                                            ),
                                            // Expanded(flex: 1, child: Text(state.listItem[i].valorUnitario.toString())),
                                          ],
                                        ),
                                      ],
                                    ),
                                  (CalculateReportsSoldByCity()) => Column(
                                      children: [
                                        const Row(
                                          children: [
                                            Expanded(flex: 2, child: Text("Cidade")),
                                            Expanded(flex: 1, child: Text("Quantidade")),
                                            Expanded(flex: 1, child: Text("Valor")),
                                          ],
                                        ),
                                        const Gap(20),
                                        for (int i = 0; i < state.listCities.length; i++)
                                          Row(
                                            children: [
                                              Expanded(
                                                flex: 2,
                                                child: Text(
                                                  state.listCities[i].name,
                                                  style: Style.defaultStyle,
                                                ),
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: Text(
                                                  state.listCities[i].amount.toString(),
                                                  style: Style.defaultStyle,
                                                ),
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: Text(
                                                  state.listCities[i].total.toString(),
                                                  style: Style.defaultStyle,
                                                ),
                                              ),
                                            ],
                                          ),
                                      ],
                                    ),
                                };
                              },
                            )
                          ],
                        ),
                    };
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
