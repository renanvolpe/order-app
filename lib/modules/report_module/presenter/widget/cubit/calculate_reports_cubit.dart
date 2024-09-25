import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:order_app/modules/order_module/domain/model/order/item_model.dart';
import 'package:order_app/modules/order_module/domain/model/order/order_model.dart';

import '../../../domain/model/city_count.dart';

part 'calculate_reports_state.dart';

class CalculateReportsCubit extends Cubit<CalculateReportsState> {
  CalculateReportsCubit() : super(CalculateReportsInitial());
  late List<OrderModel> _listOrderModel;

  void init(List<OrderModel> listOrderModel) => _listOrderModel = listOrderModel;

  void calculateMoreSold() {
    List<ItemModel> listItem = [];
    for (var order in _listOrderModel) {
      for (var item in order.itens) {
        ItemModel hasItem = listItem.firstWhere(
          (i) => i.idProduto == item.idProduto,
          orElse: () => _emptyItemModel,
        );

        if (hasItem.quantidade != 0) {
          hasItem.quantidade += item.quantidade;
        } else {
          listItem.add(item);
        }
      }
    }
    listItem.sort((a, b) => b.quantidade.compareTo(a.quantidade));
    emit(CalculateReportsMoreSold(listItem));
  }

  void calculatePaidByDay() {
    var newListOrderByDate = [..._listOrderModel];
    newListOrderByDate.sort((a, b) => DateTime.parse(b.dataCriacao).compareTo(DateTime.parse(a.dataCriacao)));
    emit(CalculateReportsPaidByDay(newListOrderByDate));
  }

  void calculateSoldByCity() {
    List<CityCount> listCities = [];

    for (var order in _listOrderModel) {
      var city = listCities.firstWhere(
        (o) => o.name == order.enderecoEntrega.cidade,
        orElse: () => _emptyCityCount,
      );
      if (city.amount == 0) {
        listCities.add(CityCount(name: order.enderecoEntrega.cidade, amount: 1, total: order.valorTotal.toDouble()));
      } else {
        for (var c in listCities) {
          if (c.name == city.name) {
            c.amount++;
            c.total += city.total;
          }
        }
      }
    }

    emit(CalculateReportsSoldByCity(listCities));
  }

  void calculateByAge() {
    List<int> moreThan30 = [];
    List<int> lesstEqualThan30 = [];

    for (var order in _listOrderModel) {
      DateTime birthDate = DateTime.parse(order.cliente.dataNascimento);
      DateTime currentDate = DateTime.now();

      int age = currentDate.difference(birthDate).inDays ~/ 365;
      if (age > 30) {
        moreThan30.add(age);
      } else {
        lesstEqualThan30.add(age);
      }
    }
    // dates.sort((a, b) => DateTime.parse(a).compareTo(DateTime.parse(b)));

    emit(CalculateReportsSoldByAge(moreThan30, lesstEqualThan30));
  }

  ItemModel get _emptyItemModel => ItemModel(id: "", idProduto: "", nome: "", quantidade: 0, valorUnitario: 0);
  CityCount get _emptyCityCount => CityCount(name: "", amount: 0, total: 0.0);
}
