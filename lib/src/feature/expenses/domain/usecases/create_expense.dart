import 'package:injectable/injectable.dart';
import 'package:shared/shared.dart';
import 'package:track_wise/src/feature/expenses/data/models/expense_model.dart';

import '../entities/expense.dart';
import '../repositories/expense_repository.dart';

@injectable
class CreateExpenseUseCase implements UseCase<Expense, Expense> {
  final ExpenseRepository repository;

  CreateExpenseUseCase(this.repository);

  @override
  EitherFuture<Expense> call(Expense params) async {
    return await repository.createExpense(params as ExpenseModel);
  }
}
