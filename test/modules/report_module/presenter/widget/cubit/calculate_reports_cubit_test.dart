import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:order_app/modules/report_module/presenter/widget/cubit/calculate_reports_cubit.dart';

import 'mock_value.dart';

void main() {
  late CalculateReportsCubit calculateReportsCubit;
  setUpAll(() {
    calculateReportsCubit = CalculateReportsCubit();
    calculateReportsCubit.init(getAllOrdersModel());
  });
  tearDownAll(() {});
  group("Test all functions that is calculate report page", () {
    blocTest<CalculateReportsCubit, CalculateReportsState>(
      'test function calculateMoreSold',
      build: () => calculateReportsCubit,
      act: (cubit) => cubit.calculateMoreSold(),
      expect: () => [const CalculateReportsMoreSold([])],
    );

    blocTest<CalculateReportsCubit, CalculateReportsState>(
      'test function calculatePaidByDay',
      build: () => calculateReportsCubit,
      act: (cubit) => cubit.calculatePaidByDay(),
      expect: () => [const CalculateReportsPaidByDay([])],
    );

    blocTest<CalculateReportsCubit, CalculateReportsState>(
      'test function calculateSoldByCity',
      build: () => calculateReportsCubit,
      act: (cubit) => cubit.calculateSoldByCity(),
      expect: () => [const CalculateReportsSoldByCity([])],
    );

    blocTest<CalculateReportsCubit, CalculateReportsState>(
      'test function calculateSoldByCity',
      build: () => calculateReportsCubit,
      act: (cubit) => cubit.calculateByAge(),
      expect: () => [const CalculateReportsSoldByAge([], [])],
    );
  
  });
}
