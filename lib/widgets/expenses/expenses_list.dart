import 'package:flutter/material.dart';
import 'package:fourth_project/models/expense.dart';
import 'package:fourth_project/widgets/expenses/expense_item.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expenses,
    required this.removeExpense,
  });

  final List<Expense> expenses;
  final void Function(Expense expense) removeExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: expenses.length,
      itemBuilder: (ctx, index) {
        return Dismissible(
          // key: Key(expenses[index].toString()),
          key: UniqueKey(),
          onDismissed: (direction) {
            removeExpense(expenses[index]);
          },
          child: ListTile(
            title: ExpneseItem(expense: expenses[index]),
          ),
        );
      },
    );
  }
}
