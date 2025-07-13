import "package:flutter/material.dart";
import "package:firstproject/styled_text.dart";
import "package:firstproject/rollDice.dart";

class GradientContainer extends StatelessWidget {
  GradientContainer({super.key,required this.colors});
  final List<Color> colors;

  var activeDiceImage = "assets/images/dice-6.png";
  void rollDice(){
    activeDiceImage = "assets/images/dice-5.png";
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
          child:DiceRoller()
        ),
    );
  }
}

