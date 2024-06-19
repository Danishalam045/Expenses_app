import 'package:flutter/material.dart';
import 'package:fourth_project/widgets/expenses.dart';

var kSchemeColor = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 96, 59, 181),
);

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: kSchemeColor,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kSchemeColor.onPrimaryContainer,
          foregroundColor: kSchemeColor.primaryContainer,
        ),
      ),
      home: const Expenses(),
    ),
  );
}
