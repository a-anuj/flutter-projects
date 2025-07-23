import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/question_screen.dart';
import 'package:quiz_app/questions_summary.dart';

class ResultsScreen extends StatelessWidget{
  const ResultsScreen({super.key,required this.chosenAnswers});

  final List<String> chosenAnswers;

  List<Map<String,Object>> getSummary(){
    List<Map<String,Object>> summary = [];
    for(var i=0;i<chosenAnswers.length;i++){
      summary.add(
          {
            'question_index':i,
            'question':questions[i].text,
            'correct_answer':questions[i].answers[0],
            'user_answer':chosenAnswers[i]
          }
      );
    }
    return summary;
  }

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
            QuestionsSummary(getSummary()),
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