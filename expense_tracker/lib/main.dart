import 'package:flutter/material.dart';
import 'package:expense_tracker/expenses.dart';

var kcolorScheme = ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 96, 59, 181));

void main(){
  runApp(
    MaterialApp(
      theme: ThemeData().copyWith(
        colorScheme: kcolorScheme,
        appBarTheme: AppBarTheme(
          backgroundColor: kcolorScheme.onPrimaryContainer,
          foregroundColor: kcolorScheme.primaryContainer
        ),
        cardTheme: const CardThemeData().copyWith(
            color: kcolorScheme.secondaryContainer,
          margin: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          )
          ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kcolorScheme.primaryContainer
          )
        ),
        textTheme: ThemeData().textTheme.copyWith(
          titleLarge: TextStyle(
            fontWeight: FontWeight.bold,
            color: kcolorScheme.onSecondaryContainer,
            fontSize: 18
          )
        )
      ),
      home: Expenses(), //Value,
    ),
  );
}