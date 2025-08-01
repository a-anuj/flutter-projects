import 'package:expense_tracker/chart.dart';
import 'package:expense_tracker/expenses_list.dart';
import 'package:expense_tracker/new_expense.dart';
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

  void _openAddExpenseOverlay(){
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(onAddExpense: _addExpense),
    );
  }

  void _addExpense(Expense expense){
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense){
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            duration: Duration(seconds: 3),
            content: const Text("Expense deleted"),
            action: SnackBarAction(
                label: "Undo",
                onPressed: (){
                  setState(() {
                    _registeredExpenses.insert(expenseIndex, expense);
                  });
                }
            ),
        )
    );
  }

  @override
  Widget build(context) {
    Widget mainContent = Center(
      child: Text("No expenses found. Try adding some!"),
    );

    if(_registeredExpenses.isNotEmpty){
      mainContent = ExpensesList(
          expenses: _registeredExpenses,
          onRemoveExpense: _removeExpense
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("EXPTracker"),
        actions: [
          IconButton(
              onPressed: _openAddExpenseOverlay,
              icon: Icon(Icons.add))
        ],
      ),
      body: Column(
        children: [
          Chart(expenses: _registeredExpenses),
          Expanded(
            child:mainContent,
          )
        ],
      ),
    );
  }
}