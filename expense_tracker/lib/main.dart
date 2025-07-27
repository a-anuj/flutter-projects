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
        )
      ),
      home: Expenses(), //Value,
    ),
  );
}