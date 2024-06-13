import 'package:flutter/material.dart';
import 'package:fourth_project/models/expense.dart';
import 'package:fourth_project/widgets/expenses/expense_item.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expenses});

  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: expenses.length,
      itemBuilder: (ctx, index) {
        return ListTile(
          title: ExpneseItem(
            expense: expenses[index],
          ),
        );
      },
    );
  }
}
