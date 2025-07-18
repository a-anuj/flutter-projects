import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget{
  const AnswerButton(this.answerText,{super.key});

  final answerText;
  @override
  Widget build(context){
    return(
      ElevatedButton(
          onPressed: (){},
          child: Text(answerText)
      )
    );
  }

}