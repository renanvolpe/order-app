part of 'calculate_reports_cubit.dart';

sealed class CalculateReportsState extends Equatable {
  const CalculateReportsState();

  @override
  List<Object> get props => [];
}

final class CalculateReportsInitial extends CalculateReportsState {}

final class CalculateReportsMoreSold extends CalculateReportsState {
  final List<ItemModel> listItem;

  const CalculateReportsMoreSold(this.listItem);
}

final class CalculateReportsPaidByDay extends CalculateReportsState {
  final List<OrderModel> newListOrderByDate;

  const CalculateReportsPaidByDay(this.newListOrderByDate);
}

final class CalculateReportsSoldByCity extends CalculateReportsState {
  final List<CityCount> listCities;

  const CalculateReportsSoldByCity(this.listCities);
}

final class CalculateReportsSoldByAge extends CalculateReportsState {
  final List<int> moreThan30;
  final List<int> lesstEqualThan30;

  const CalculateReportsSoldByAge(this.moreThan30, this.lesstEqualThan30);
}
