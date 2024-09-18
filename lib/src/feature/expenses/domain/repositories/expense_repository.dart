import 'package:shared/shared.dart';

import '../../data/models/expense_model.dart';

abstract interface class ExpenseRepository {
  EitherFuture<ExpenseModel> createExpense(ExpenseModel expense);
  EitherFuture<List<ExpenseModel>> getExpenses();
  Future<void> syncExpenses();
}
