import 'package:expense_tracker/expenses_list.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';

class Expenses extends StatefulWidget{
  const Expenses({super.key});

  @override
  State<Expenses> createState(){
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses>{

  final List<Expense> _registeredExpenses = [
    Expense(
        title: "Cricket Bat",
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
      appBar: AppBar(
        title: Text("EXPTracker"),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.add))
        ],
      ),
      body: Column(
        children: [
          Text("Chart goes here..."),
          Expanded(
            child: ExpensesList(expenses: _registeredExpenses),
          )
        ],
      ),
    );
  }
}