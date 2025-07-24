import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

class Expenses extends StatefulWidget{
  Expenses({super.key});

  State<Expenses> createState(){
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses>{

  final List<Expense> _registeredExpenses = [
    Expense(
        title: "Criket Bat",
        amount: 10000,
        date: DateTime.now(),
        category: Category.leisure
    ),
    Expense(
        title: "Keyboard",
        amount: 500,
        date: DateTime.now(),
        category: Category.work
    )
  ];

  @override
  Widget build(context) {
    return Scaffold(
      body: Column(
        children: [
          Text("Chart goes here..."),
          Text("Expenses goes here")
          
        ],
      ),
    );
  }
}