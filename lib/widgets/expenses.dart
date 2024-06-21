import 'package:flutter/material.dart';
import 'package:fourth_project/models/expense.dart';
import 'package:fourth_project/widgets/chart/chart.dart';
import 'package:fourth_project/widgets/expenses/expenses_list.dart';
import 'package:fourth_project/widgets/new_expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpnesesState();
  }
}

class _ExpnesesState extends State<Expenses> {
  final List<Expense> _registeredExpneses = [
    Expense(
      title: 'Flutter Course',
      amount: 19.99,
      data: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Cinema',
      amount: 15.69,
      data: DateTime.now(),
      category: Category.leisure,
    ),
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(
        onAddExpense: _addingExpense,
      ),
    );
  }

  void _addingExpense(Expense expense) {
    setState(() {
      _registeredExpneses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpneses.indexOf(expense);
    setState(() {
      _registeredExpneses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text("Item deleted"),
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
          label: "UNDO",
          onPressed: () {
            setState(() {
              _registeredExpneses.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text("No expense found, Start adding some!"),
    );

    if (_registeredExpneses.isNotEmpty) {
      mainContent = Column(
        children: [
          Chart(expenses: _registeredExpneses),
          ExpensesList(
            expenses: _registeredExpneses,
            removeExpense: _removeExpense,
          )
        ],
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Expenses Tracker'),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: mainContent,
    );
  }
}
