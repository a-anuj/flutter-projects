import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget{
  const AnswerButton({
    super.key,
    required this.answerText,
    required this.onTap
  });

  final answerText;
  final void Function() onTap;

  @override
  Widget build(context){
    return(
      ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 40,
            ),
            backgroundColor: Colors.grey,
            foregroundColor: Colors.white
          ),
          child: Text(answerText, textAlign: TextAlign.center,)
      )
    );
  }

}