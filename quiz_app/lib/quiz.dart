import 'package:flutter/material.dart';
import 'package:quiz_app/backgroundContainer.dart';
import 'package:quiz_app/question_screen.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/resutls_screen.dart';

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

        activeScreen="results-screen";
      }
    });
  }

  @override
  Widget build(context){
    Widget screenWidget = bgContainer(switchScreen);

    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(
        onSelectAnswer: chooseAnswer,
      );
    }

    if (activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(
        chosenAnswers: selectedAnswers,
      );
    }
    return MaterialApp(
      home:Scaffold(
          body: Container(
              color: Colors.deepOrange,
              child: screenWidget,
          )
      ),
    );
  }
}