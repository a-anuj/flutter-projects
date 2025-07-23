import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/question_screen.dart';
import 'package:quiz_app/questions_summary.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsScreen extends StatelessWidget{
  const ResultsScreen({super.key,required this.chosenAnswers,required this.switchScreen});
  
  final void Function() switchScreen;
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
    final summaryData = getSummary();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data){
              return data["correct_answer"]==data["user_answer"];
            }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("$numCorrectQuestions questions out of $numTotalQuestions are correct!",
              style: GoogleFonts.lato(
              color: const Color.fromARGB(255, 230, 200, 253),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            )
            ),
            SizedBox(height:30),
            QuestionsSummary(summaryData),
            SizedBox(height:30),

            TextButton.icon(
                onPressed: switchScreen,
                style: TextButton.styleFrom(
                    foregroundColor: Colors.white
                ),
                icon: const Icon(Icons.refresh),
                label:const Text("Restart Quiz")
            )

          ],
        ),
      ),
    );
  }
}