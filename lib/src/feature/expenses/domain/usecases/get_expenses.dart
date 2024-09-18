import 'package:dartz/dartz.dart';
import 'package:shared/shared.dart';

import '../entities/expense.dart';
import '../repositories/expense_repository.dart';

class GetExpenses implements UseCaseWithoutParams<List<Expense>> {
  final ExpenseRepository _repository;

  GetExpenses(this._repository);

  @override
  EitherFuture<List<Expense>> call() async {
    final response = await _repository.getExpenses();

    return response.fold(
      (failure) => Left(failure),
      (expenses) => Right(expenses),
    );
  }
}
