import "package:flutter/material.dart";

class bgContainer extends StatelessWidget{
  const bgContainer({super.key});

  quiz(){};

  @override
  Widget build(context){
    return Container(
        color: Colors.deepOrange,
        child: Center(
          child: Column(
            mainAxisSize:MainAxisSize.min,
            children: [
              Image.asset("assets/images/quiz-logo.png",width: 300,),
              Text("Learn Flutter the Fun way!"),
              TextButton(onPressed: quiz, child: Text("Start Quiz"))
            ],
          ),
        ),
    );
  }
}