import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:shared/shared.dart';
import 'package:track_wise/src/core/connection/network_info.dart';
import 'package:track_wise/src/feature/expenses/data/sources/local/expense_local_data_source.dart';

import '../../domain/repositories/expense_repository.dart';
import '../models/expense_do_model.dart';
import '../models/expense_model.dart';
import '../sources/remote/expense_remote_data_source.dart';

@Injectable(as: ExpenseRepository)
final class ExpenseRepositoryImpl implements ExpenseRepository {
  final ExpenseRemoteDataSource _remoteDataSource;
  final ExpenseLocalDataSource _localDataSource;
  final NetworkInfo _networkInfo;
  ExpenseRepositoryImpl(
      this._remoteDataSource, this._localDataSource, this._networkInfo);

  @override
  EitherFuture<ExpenseModel> createExpense(ExpenseModel expense) async {
    try {
      if (!await _networkInfo.isConnected) {
        final result =
            await _localDataSource.addExpense(expense as ExpenseDoModel);
        return Right(result as ExpenseModel);
      }

      final result = await _remoteDataSource.createExpense(expense);
      await _localDataSource.addExpense(result as ExpenseDoModel);
      return Right(result);
    } catch (e) {
      return Left(Failure("Error creating expense"));
    }
  }

  @override
  EitherFuture<List<ExpenseModel>> getExpenses({bool isFirst = false}) async {
    try {
      if (isFirst && await _networkInfo.isConnected) {
        final remoteExpenses = await _remoteDataSource.getExpenses();
        await _localDataSource
            .saveExpenses(remoteExpenses as List<ExpenseDoModel>);

        return Right(remoteExpenses);
      }

      final result = await _localDataSource.getExpenses();
      return Right(result as List<ExpenseModel>);
    } catch (e) {
      return Left(Failure("Error getting expenses"));
    }
  }
}
