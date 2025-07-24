import 'package:flutter/material.dart';

class Expense extends StatefulWidget{
  Expense({super.key});

  State<Expense> createState(){
    return _ExpenseState();
  }
}

class _ExpenseState extends State<Expense>{
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