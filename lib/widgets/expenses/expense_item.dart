import 'package:flutter/material.dart';
import 'package:fourth_project/models/expense.dart';

// ignore: must_be_immutable
class ExpneseItem extends StatelessWidget {
  ExpneseItem({super.key, required this.expense});

  Expense expense;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(2.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            expense.title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Row(
            children: [
              Text((expense.amount).toString()),
              const Spacer(),
              Icon(CategoryItem[expense.category]),
              Text(expense.formattedDate),
            ],
          ),
        ],
      ),
    );
  }
}
