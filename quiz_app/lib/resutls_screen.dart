import 'package:flutter/material.dart';

class ResultsScreen extends StatelessWidget{
  ResultsScreen({super.key});

  @override
  Widget build(context){
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("X questions out of Y are correct!"),
            SizedBox(height:30),
            Text("List of answers and questions!!"),
            SizedBox(height:30),
            TextButton(
                onPressed: (){},
                child: Text("Restart Quiz")
            )
          ],
        ),
      ),
    );
  }
}