import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:track_wise/src/core/cache/shared_preferences/shared_preferences_manager.dart';
import 'package:track_wise/src/feature/expenses/data/models/expense_model.dart';
import 'package:track_wise/src/feature/expenses/domain/usecases/create_expense.dart';
import 'package:track_wise/src/feature/expenses/domain/usecases/get_expenses.dart';

import '../../../../core/injection/injection_container.dart';
import 'expense_event.dart';
import 'expense_state.dart';

@injectable
class ExpenseBloc extends Bloc<ExpenseEvent, ExpenseState> {
  final GetExpensesUseCase getExpenses;
  final CreateExpenseUseCase createExpense;

  ExpenseBloc(this.createExpense, this.getExpenses) : super(ExpenseInitial()) {
    on<LoadExpenses>((event, emit) async {
      emit(ExpenseLoading());

      final firstInstall =
          await di<SharedPreferencesManager>().checkFirtLaunch();

      if (firstInstall) {
        final result = await getExpenses();
        result.fold(
          (failure) =>
              emit(ExpenseError(failure.message ?? 'An error occurred')),
          (expenses) => emit(ExpenseLoaded(expenses)),
        );
        return;
      }

      final result = await getExpenses();
      result.fold(
        (failure) => emit(ExpenseError(failure.message ?? 'An error occurred')),
        (expenses) => emit(ExpenseLoaded(expenses)),
      );
    });

    on<CreateExpense>((event, emit) async {
      emit(ExpenseLoading());
      final result = await createExpense(event.expense as ExpenseModel);
      result.fold(
        (failure) => emit(ExpenseError(failure.message ?? 'An error occurred')),
        (expense) => add(LoadExpenses()),
      );
    });
  }
}
