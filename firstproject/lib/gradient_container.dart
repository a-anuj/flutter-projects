import "package:flutter/material.dart";
import "package:firstproject/styled_text.dart";

class GradientContainer extends StatelessWidget {
  const GradientContainer({super.key,required this.colors});
  final List<Color> colors;
  
  void rollDice(){
    
  }
  
  @override
  Widget build(context){
    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors:colors,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight
          ),
        ),
        child :Center(
          child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
              Image.asset("assets/images/dice-6.png",
              width:200,
                 ),
                TextButton(
                      onPressed: rollDice,
                      style:TextButton.styleFrom(
                        padding: EdgeInsets.only(top:30,left: 30,right: 30,bottom: 30),
                      foregroundColor: Colors.black,
                      textStyle: const TextStyle(fontSize: 25),

                    ),
                    child: Text("Roll Dice")
                )
          ]),
        ),
    );
  }
}

