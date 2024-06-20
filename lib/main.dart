import 'package:flutter/material.dart';
import 'package:fourth_project/widgets/expenses.dart';

var kSchemeColor = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 96, 59, 181),
);

var kDarkSchemeColor = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(
    255,
    5,
    99,
    125,
  ),
);

void main() {
  runApp(
    MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: kDarkSchemeColor,
        cardTheme: const CardTheme().copyWith(
          color: kDarkSchemeColor.secondaryContainer,
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kDarkSchemeColor.primaryContainer,
            foregroundColor: kDarkSchemeColor.onPrimaryContainer,
          ),
        ),
      ),
      theme: ThemeData().copyWith(
        colorScheme: kSchemeColor,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kSchemeColor.onPrimaryContainer,
          foregroundColor: kSchemeColor.primaryContainer,
        ),
        cardTheme: const CardTheme().copyWith(
            color: kSchemeColor.secondaryContainer,
            margin: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            )),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kSchemeColor.primaryContainer,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                fontWeight: FontWeight.bold,
                color: kSchemeColor.onSecondaryContainer,
                fontSize: 16,
              ),
            ),
      ),
      home: const Expenses(),
    ),
  );
}
