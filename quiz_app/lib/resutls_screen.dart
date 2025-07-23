import 'package:flutter/material.dart';

class ResultsScreen extends StatelessWidget{

  @override
  Widget build(context){
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          children: [
            Text("X questions out of Y are correct!")
            SizedBox(30);
          ],
        ),
      ),
    )
  }
}