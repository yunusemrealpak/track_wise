import 'package:hive_flutter/hive_flutter.dart';
import 'package:track_wise/src/feature/expenses/data/models/expense_do_model.dart';

class HiveInit {
  static Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(ExpenseDoModelAdapter());
  }
}
