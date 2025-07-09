import 'package:flutter/material.dart';

void main() {
  runApp(
     MaterialApp(
      home: Scaffold(
          body: Container(
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
          )
      ),
    ),
  );
}
