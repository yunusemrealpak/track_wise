import 'package:expenses/src/data/models/expense_model.dart';

import '../../domain/repositories/expense_repository.dart';

final class ExpenseRepositoryImpl implements ExpenseRepository {
  @override
  Future<void> createExpense(ExpenseModel expense) {
    // TODO: implement createExpense
    throw UnimplementedError();
  }

  @override
  Future<void> deleteExpense(ExpenseModel expense) {
    // TODO: implement deleteExpense
    throw UnimplementedError();
  }

  @override
  Future<List<ExpenseModel>> getExpenses() {
    // TODO: implement getExpenses
    throw UnimplementedError();
  }

  @override
  Future<void> updateExpense(ExpenseModel expense) {
    // TODO: implement updateExpense
    throw UnimplementedError();
  }
}
