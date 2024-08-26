import 'package:expenses/src/data/models/expense_model.dart';

abstract interface class ExpenseRepository {
  Future<void> createExpense(ExpenseModel expense);
  Future<void> deleteExpense(ExpenseModel expense);
  Future<List<ExpenseModel>> getExpenses();
  Future<void> updateExpense(ExpenseModel expense);
}
