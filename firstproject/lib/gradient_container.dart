import "package:flutter/material.dart";

class GradientContainer extends StatelessWidget {
  const GradientContainer({super.key});
  @override
  Widget build(context){
    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors:
          [
            Colors.purple,Colors.deepPurple
          ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight
          ),
        ),
        child :Center(
          child: Text("First Flutter App",
            style:TextStyle(
              color: Colors.white,
              fontSize: 28,
            ),
          ),
        )
    );
  }
}
