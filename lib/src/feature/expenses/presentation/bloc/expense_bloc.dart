import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:track_wise/src/feature/expenses/data/models/expense_model.dart';

import '../../data/repositories/expense_repository_impl.dart';
import 'expense_event.dart';
import 'expense_state.dart';

class ExpenseBloc extends Bloc<ExpenseEvent, ExpenseState> {
  final ExpenseRepositoryImpl expenseRepository;

  ExpenseBloc(this.expenseRepository) : super(ExpenseInitial()) {
    on<LoadExpenses>((event, emit) async {
      emit(ExpenseLoading());
      final result = await expenseRepository.getExpenses();
      result.fold(
        (failure) => emit(ExpenseError(failure.message ?? 'An error occurred')),
        (expenses) => emit(ExpenseLoaded(expenses)),
      );
    });

    on<CreateExpense>((event, emit) async {
      emit(ExpenseLoading());
      final result =
          await expenseRepository.createExpense(event.expense as ExpenseModel);
      result.fold(
        (failure) => emit(ExpenseError(failure.message ?? 'An error occurred')),
        (expense) => add(LoadExpenses()),
      );
    });
  }
}
