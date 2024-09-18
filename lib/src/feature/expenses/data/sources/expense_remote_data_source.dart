import 'package:injectable/injectable.dart';
import 'package:network/network.dart';

import '../../core/network_paths.dart';
import '../models/expense_model.dart';

abstract interface class ExpenseRemoteDataSource {
  Future<List<ExpenseModel>> getExpenses();
  Future<ExpenseModel> createExpense(ExpenseModel expense);
}

@Injectable(as: ExpenseRemoteDataSource)
final class ExpenseRemoteDataSourceImpl implements ExpenseRemoteDataSource {
  final NetworkManager _networkManager;
  ExpenseRemoteDataSourceImpl(this._networkManager);

  @override
  Future<ExpenseModel> createExpense(ExpenseModel expense) async {
    return await _networkManager.send<ExpenseModel>(
      NetworkPaths.expenses.value,
      type: HttpTypes.POST,
      body: expense.toJson(),
      returnType: ReturnTypes.single,
      parserModel: ExpenseModel(),
    );
  }

  @override
  Future<List<ExpenseModel>> getExpenses() async {
    return await _networkManager.send<ExpenseModel>(
      NetworkPaths.expenses.value,
      type: HttpTypes.GET,
      returnType: ReturnTypes.list,
      parserModel: ExpenseModel(),
    );
  }
}
