import 'package:flutter/material.dart';
import 'package:quiz_app/backgroundContainer.dart';

class Quiz extends StatefulWidget{

}


class _QuizState extends State<Quiz>{
  Widget build(context){
    return MaterialApp(
      home:Scaffold(
          body: bgContainer()
      ),
    );
  }
}