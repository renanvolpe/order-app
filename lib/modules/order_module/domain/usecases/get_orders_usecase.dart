// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:order_app/modules/core/utils/abstract_usecase.dart';
import 'package:order_app/modules/core/utils/failure.dart';
import 'package:order_app/modules/order_module/data/order_repository.dart';
import 'package:order_app/modules/order_module/domain/model/order/order_model.dart';

// THIS USECASE
// GET FROM API THE LIST OF ORDERS
// SAVE IN LOCAL HIVE DB
// RETURN LIST OF ORDERS FROM LOCAL HIVE VALUES
class GetOrdersUsecase extends IUseCase<NoParam, List<OrderModel>> {
  OrderRepositoryImpl repository;
  GetOrdersUsecase({
    required this.repository,
  });
  @override
  Future<Either<Failure, List<OrderModel>>> call(NoParam params) async {
    try {
      var responseRemote = await repository.getListOrdersRemote();

      return responseRemote.fold((failure) {
        return Left(failure);
      }, (success) async {
        await repository.postListOrderLocal(success);

        var responselocal = await repository.getListOrdersLocal();
        return responselocal.fold((failure) => Left(failure), (success) => Right(success));
      });
    } catch (e) {
      return const Left(UnexpectedFailure());
    }
  }


}
