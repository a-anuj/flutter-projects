import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';

class QuestionsScreen extends StatefulWidget{
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState(){
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen>{

  final currentQuestion = questions[0];

  @override
  Widget build(context){
    return(
        SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(currentQuestion.text,
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 20),
              ...currentQuestion.answers.map((item){
                return AnswerButton(answerText: item,onTap: (){},);
              })
              ],
          ),
        )
    );
  }
}