import "package:flutter/material.dart";

class bgContainer extends StatelessWidget{
  const bgContainer({super.key});

  quiz(){}

  @override
  Widget build(context){
    return Center(
          child: Column(
            mainAxisSize:MainAxisSize.min,
            children: [
              Image.asset("assets/images/quiz-logo.png",
                width: 300,
                color: Color.fromARGB(150, 255, 255, 255),
              ),
              SizedBox(height: 80),
              Text("Learn Flutter the Fun way!",
              style: TextStyle(
                fontSize: 25,
                color: Colors.white
                  )
                ,),
              SizedBox(height: 40),
              OutlinedButton.icon(
                  onPressed: quiz,
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      color:Colors.white,
                    ),
                    foregroundColor: Colors.white, 
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)
                      )
                    ),
                    icon:Icon(Icons.arrow_right_alt),
                    label: Text("Start Quiz",
                      style: TextStyle(fontSize: 18,color: Colors.white),
                    )
              )
            ],
          ),
        ),
    );
  }
}