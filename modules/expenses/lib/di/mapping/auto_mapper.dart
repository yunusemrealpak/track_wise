import 'package:auto_mappr_annotation/auto_mappr_annotation.dart';
import 'package:expenses/src/data/models/expense_model.dart';
import 'package:expenses/src/domain/entities/expense.dart';

import 'auto_mapper.auto_mappr.dart';

@AutoMappr([
  MapType<Expense, ExpenseModel>(),
])
class AutoMapper extends $AutoMapper {}
