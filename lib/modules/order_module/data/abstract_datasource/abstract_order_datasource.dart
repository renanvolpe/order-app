import '../../domain/model/order/order_model.dart';

abstract class IOrderDatasource {
  getListOrders();
  saveOrder(List<OrderModel> listOrders);
}
