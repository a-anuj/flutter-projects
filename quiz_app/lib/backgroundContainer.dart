import "package:flutter/material.dart";

class bgContainer extends StatelessWidget{
  const bgContainer({super.key});

  quiz(){}

  @override
  Widget build(context){
    return Container(
        color: Colors.deepOrange,
        child: Center(
          child: Column(
            mainAxisSize:MainAxisSize.min,
            children: [
              Image.asset("assets/images/quiz-logo.png",width: 300,),
              SizedBox(height: 30),
              Text("Learn Flutter the Fun way!",
              style: TextStyle(
                fontSize: 25,
                color: Colors.white
                  )
                ,),
              SizedBox(height: 40),
              TextButton(onPressed: quiz, child: Text("Start Quiz",
              style: TextStyle(fontSize: 18,color: Colors.white),))
            ],
          ),
        ),
    );
  }
}