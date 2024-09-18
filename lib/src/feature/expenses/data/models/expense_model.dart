import 'package:network/network.dart';

import '../../domain/entities/expense.dart';

class ExpenseModel extends Expense implements NetworkEntity<ExpenseModel> {
  ExpenseModel({
    super.id,
    super.title,
    super.amount,
    super.date,
    super.categoryId,
  });

  factory ExpenseModel.fromMap(Map<String, dynamic> map) {
    return ExpenseModel(
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

  @override
  ExpenseModel fromJson(Map<String, dynamic> json) =>
      ExpenseModel.fromMap(json);

  @override
  Map<String, dynamic> toJson() => toMap();
}
