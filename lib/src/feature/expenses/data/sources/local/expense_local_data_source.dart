import 'package:injectable/injectable.dart';
import 'package:track_wise/src/feature/expenses/data/models/expense_do_model.dart';

import '../../../../../core/cache/cache_manager.dart';
import '../../../../../core/cache/hive/hive_cache_manager.dart';

abstract interface class ExpenseLocalDataSource {
  Future<List<ExpenseDoModel>> getExpenses();
  Future<void> saveExpenses(List<ExpenseDoModel> expenses);
  Future<void> addExpense(ExpenseDoModel expense);
}

@LazySingleton(as: ExpenseLocalDataSource)
class ExpenseLocalDataSourceImpl implements ExpenseLocalDataSource {
  final CacheManager<ExpenseDoModel> _cacheManager;

  ExpenseLocalDataSourceImpl()
      : _cacheManager = HiveCacheManager<ExpenseDoModel>("expenseBox");

  @override
  Future<List<ExpenseDoModel>> getExpenses() async {
    return _cacheManager.getItems();
  }

  @override
  Future<void> saveExpenses(List<ExpenseDoModel> expenses) async {
    await _cacheManager.clear();
    await _cacheManager.addItems(expenses);
  }

  @override
  Future<void> addExpense(ExpenseDoModel expense) async {
    await _cacheManager.addItem(expense);
  }
}
