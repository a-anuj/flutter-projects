import 'dart:math';

import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget{
  const ExpenseItem(this.expense,{super.key});
  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        child: Column(
          children: [
            Text(expense.title),
            SizedBox(height: 4),
            Row(
              children: [
                Text('₹${expense.amount.toStringAsFixed(2)}'),
                const Spacer(),
                Row(
                  children: [
                    Icon(categoryIcons[expense.category]),
                    SizedBox(width: 8),
                    Text(expense.formattedDate)
                  ],
                )
              ],
            )

          ],
        )
      ),
    );

  }
}