import "package:flutter/material.dart";
import "dart:math";

class DiceRoller extends StatefulWidget{
  const DiceRoller({super.key});

  State<DiceRoller>createState(){
     return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller>{
  
  var activeDiceImage = "assets/images/dice-6.png";

  void rollTheDice(){
    setState(() {
      activeDiceImage = "assets/images/dice-2.png";
    });
  }

  @override
  Widget build(context){
    return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(activeDiceImage,
            width:200,
          ),
          TextButton(
              onPressed: rollTheDice,
              style:TextButton.styleFrom(
                padding: EdgeInsets.only(top:30,left: 30,right: 30,bottom: 30),
                foregroundColor: Colors.black,
                textStyle: const TextStyle(fontSize: 25),
              ),
              child: Text("Roll Dice")
          )
        ]);

  }

}