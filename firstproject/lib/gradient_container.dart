import "package:flutter/material.dart";
import "package:firstproject/styled_text.dart";

class GradientContainer extends StatelessWidget {
  const GradientContainer({super.key,required this.colors});
  final List<Color> colors;
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
          child: Image.asset("assets/images/dice-6.png",
            width:200,
          ),
        )
    );
  }
}

