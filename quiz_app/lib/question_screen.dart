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
          child:Container(
            margin: EdgeInsets.all(40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment:CrossAxisAlignment.stretch,
              children: [
                Text(
                  currentQuestion.text,
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                ...currentQuestion.answers.map((item){
                  return AnswerButton(answerText: item,onTap: (){},);
                })
              ],
            ),
          )

        )
    );
  }
}