import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:shared/shared.dart';

import '../../domain/repositories/expense_repository.dart';
import '../models/expense_model.dart';
import '../sources/expense_remote_data_source.dart';

@Injectable(as: ExpenseRepository)
final class ExpenseRepositoryImpl implements ExpenseRepository {
  final ExpenseRemoteDataSource _remoteDataSource;
  ExpenseRepositoryImpl(this._remoteDataSource);

  @override
  EitherFuture<ExpenseModel> createExpense(ExpenseModel expense) async {
    try {
      final result = await _remoteDataSource.createExpense(expense);
      return Right(result);
    } catch (e) {
      return Left(Failure("Error creating expense"));
    }
  }

  @override
  EitherFuture<List<ExpenseModel>> getExpenses() async {
    try {
      final result = await _remoteDataSource.getExpenses();
      return Right(result);
    } catch (e) {
      return Left(Failure("Error getting expenses"));
    }
  }
}
