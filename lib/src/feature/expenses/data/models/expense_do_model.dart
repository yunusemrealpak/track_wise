import 'package:hive_flutter/adapters.dart';
import 'package:track_wise/src/feature/expenses/domain/entities/expense_do.dart';

part 'expense_do_model.g.dart';

@HiveType(typeId: 0)
final class ExpenseDoModel extends HiveObject implements ExpenseDo {
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

  ExpenseDoModel({
    this.amount,
    this.categoryId,
    this.date,
    this.id,
    this.title,
  });

  factory ExpenseDoModel.fromMap(Map<String, dynamic> map) {
    return ExpenseDoModel(
      id: map['id'],
      title: map['title'],
      amount: map['amount'],
      date: DateTime.parse(map['date']),
      categoryId: map['categoryId'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'amount': amount,
      'date': date?.toIso8601String(),
      'categoryId': categoryId,
    };
  }
}
