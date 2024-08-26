import 'package:network/core/models/network_entity.dart';

class ExpenseModel extends NetworkEntity<ExpenseModel> {
  String? id;
  String? title;
  double? amount;
  DateTime? date;
  String? categoryId;

  ExpenseModel({
    this.id,
    this.title,
    this.amount,
    this.date,
    this.categoryId,
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
