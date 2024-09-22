import 'package:dartz/dartz.dart';
import 'package:shared/shared.dart';
import 'package:track_wise/src/core/extensions/dartz_extensions.dart';
import 'package:track_wise/src/feature/expenses/data/models/expense_do_model.dart';
import 'package:track_wise/src/feature/expenses/data/models/expense_model.dart';

import '../repositories/expense_repository.dart';

final class SyncExpensesUseCase
    implements UseCaseWithoutParams<List<ExpenseModel>> {
  final ExpenseRepository _repository;

  SyncExpensesUseCase(this._repository);

  @override
  EitherFuture<List<ExpenseModel>> call() async {
    final response = await _repository.getExpenses();

    if (response.isLeft()) {
      return response;
    }

    final localExpenses = [...response.right as List<ExpenseDoModel>];

    for (final expense in localExpenses) {
      final index =
          localExpenses.indexWhere((element) => element.id == expense.id);
      if (expense.isSynced) {
        continue;
      }

      final result = await _repository.createExpense(expense as ExpenseModel);
      if (result.isLeft()) {
        return Left(Failure('Error syncing expenses'));
      }

      localExpenses[index] = result.right as ExpenseDoModel;
    }

    return Right(localExpenses as List<ExpenseModel>);
  }
}
