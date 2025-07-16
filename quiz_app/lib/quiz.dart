import 'package:flutter/material.dart';
import 'package:quiz_app/backgroundContainer.dart';
import 'package:quiz_app/question_screen.dart';

class Quiz extends StatefulWidget{
  const Quiz({super.key});

  @override
  State<Quiz> createState(){
    return _QuizState();
  }
}


class _QuizState extends State<Quiz>{
  Widget activeScreen = bgContainer();

  void switchScreen(){
    setState(() {
      activeScreen = QuestionsScreen();
    });
  }

  @override
  Widget build(context){
    return MaterialApp(
      home:Scaffold(
          body: Container(
              color: Colors.deepOrange,
              child: activeScreen,
          )
      ),
    );
  }
}