import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:track_wise/core/injection/injection_container.dart';

import '../../data/repositories/expense_repository_impl.dart';
import '../bloc/expense_bloc.dart';
import '../bloc/expense_event.dart';
import '../bloc/expense_state.dart';

class ExpenseListView extends StatelessWidget {
  const ExpenseListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ExpenseBloc(di<ExpenseRepositoryImpl>())..add(LoadExpenses()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Expenses'),
        ),
        body: BlocBuilder<ExpenseBloc, ExpenseState>(
          builder: (context, state) {
            if (state is ExpenseLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ExpenseLoaded) {
              return ListView.builder(
                itemCount: state.expenses.length,
                itemBuilder: (context, index) {
                  final expense = state.expenses[index];
                  return ListTile(
                    title: Text(expense.title ?? ''),
                    subtitle: Text(expense.amount.toString()),
                  );
                },
              );
            } else if (state is ExpenseError) {
              return Center(child: Text(state.message));
            } else {
              return const Center(child: Text('No expenses found'));
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Add your create expense logic here
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
