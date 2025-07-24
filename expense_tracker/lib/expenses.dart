import 'package:flutter/material.dart';

class Expenses extends StatefulWidget{
  Expenses({super.key});

  State<Expenses> createState(){
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses>{
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