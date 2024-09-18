import 'package:injectable/injectable.dart';
import 'package:track_wise/src/feature/expenses/data/models/expense_do.dart';

import '../../../../../core/cache/cache_manager.dart';
import '../../../../../core/cache/hive/hive_cache_manager.dart';

abstract interface class ExpenseLocalDataSource {
  Future<List<ExpenseDo>> getExpenses();
  Future<void> saveExpenses(List<ExpenseDo> expenses);
  Future<void> addExpense(ExpenseDo expense);
}

@LazySingleton(as: ExpenseLocalDataSource)
class ExpenseLocalDataSourceImpl implements ExpenseLocalDataSource {
  final CacheManager<ExpenseDo> _cacheManager;

  ExpenseLocalDataSourceImpl()
      : _cacheManager = HiveCacheManager<ExpenseDo>("expenseBox");

  @override
  Future<List<ExpenseDo>> getExpenses() async {
    return _cacheManager.getItems();
  }

  @override
  Future<void> saveExpenses(List<ExpenseDo> expenses) async {
    await _cacheManager.clear();
    await _cacheManager.addItems(expenses);
  }

  @override
  Future<void> addExpense(ExpenseDo expense) async {
    await _cacheManager.addItem(expense);
  }
}
