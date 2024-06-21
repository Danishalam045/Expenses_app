import 'package:flutter/material.dart';
import 'package:fourth_project/models/expense.dart';

// ignore: must_be_immutable
class ExpneseItem extends StatelessWidget {
  ExpneseItem({super.key, required this.expense});

  Expense expense;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              expense.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 4,
            ),
            Row(
              children: [
                Text((expense.amount).toString()),
                const Spacer(),
                Row(children: [
                  Icon(CategoryItem[expense.category]),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(expense.formattedDate),
                ])
              ],
            ),
          ],
        ),
      ),
    );
  }
}
