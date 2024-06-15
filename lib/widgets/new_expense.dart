import 'package:flutter/material.dart';
import 'package:fourth_project/models/expense.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? selectDate;
  late var dropdownValue = Category.food;

  void _presentDatePicker() async {
    var now = DateTime.now();
    var firstDate = DateTime(now.year - 1, now.month, now.day);

    var pickDate = await showDatePicker(
        context: context,
        firstDate: firstDate,
        initialDate: now,
        lastDate: now);
    setState(() {
      selectDate = pickDate;
    });
  }

  void _submitExpenseData() {
    final enteredAmount = double.tryParse(_amountController.text);
    final amountIsInvalid = enteredAmount == null || enteredAmount <= 0.0;
    if (_titleController.text.trim().isEmpty ||
        amountIsInvalid ||
        selectDate == null) {
      showDialog(
          context: context,
          builder: (BuildContext ctx) {
            return AlertDialog(
              title: const Text('Invalid input'),
              content: const Text(
                  'Please make sure a valid title,amount,date and category was entered.'),
              actions: [
                TextButton(
                  onPressed: Navigator.of(ctx).pop,
                  child: const Text('Okay'),
                ),
              ],
            );
          });
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            decoration: const InputDecoration(
              labelText: 'Title',
              hintText: "Enter your text",
            ),
            maxLength: 50,
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Amount',
                    prefixText: '\$ ',
                    hintText: 'Enter amount',
                  ),
                ),
              ),
              const SizedBox(
                width: 26.0,
              ),
              Row(
                children: [
                  // const Text('Selected Date'),
                  Text(selectDate != null
                      ? formatter.format((selectDate) as DateTime)
                      : "select Date"),
                  IconButton(
                    onPressed: _presentDatePicker,
                    icon: const Icon(Icons.calendar_month),
                  ),
                ],
              )
            ],
          ),
          Row(
            children: [
              DropdownButton(
                value: dropdownValue,
                items: Category.values.map((category) {
                  return DropdownMenuItem(
                      value: category, child: Text(category.name.toString()));
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    dropdownValue = value!;
                  });
                },
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('cancel'),
              ),
              ElevatedButton(
                onPressed: _submitExpenseData,
                child: const Text(
                  'Save expnese',
                  selectionColor: Colors.pink,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
