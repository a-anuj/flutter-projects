import 'package:flutter/material.dart';
import 'package:quiz_app/backgroundContainer.dart';
import 'package:quiz_app/question_screen.dart';
import 'package:quiz_app/data/questions.dart';

class Quiz extends StatefulWidget{
  const Quiz({super.key});

  @override
  State<Quiz> createState(){
    return _QuizState();
  }
}


class _QuizState extends State<Quiz>{
  List<String> selectedAnswers = [];
  var activeScreen = "bg-container";

  void switchScreen(){
    setState(() {
      activeScreen = "questions-screen";
    });
  }

  void chooseAnswer(String answer){
    selectedAnswers.add(answer);
    setState((){

      if(selectedAnswers.length==questions.length){
        selectedAnswers = [];
        activeScreen="bg-container";
      }
    });
  }

  @override
  Widget build(context){
    return MaterialApp(
      home:Scaffold(
          body: Container(
              color: Colors.deepOrange,
              child: activeScreen == "bg-container"
                  ? bgContainer(switchScreen)
                  : QuestionsScreen(onSelectAnswer: chooseAnswer),
          )
      ),
    );
  }
}