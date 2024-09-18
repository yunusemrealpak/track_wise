import 'package:hive_flutter/adapters.dart';
import 'package:track_wise/src/feature/expenses/domain/entities/expense.dart';

part 'expense_do.g.dart';

@HiveType(typeId: 0)
final class ExpenseDo extends HiveObject implements Expense {
  @HiveField(0)
  @override
  String? id;

  @HiveField(1)
  @override
  String? categoryId;

  @HiveField(2)
  @override
  DateTime? date;

  @HiveField(3)
  @override
  double? amount;

  @HiveField(4)
  @override
  String? title;

  bool get isSynced => id != null;

  ExpenseDo({
    this.amount,
    this.categoryId,
    this.date,
    this.id,
    this.title,
  });
}
