import 'package:flutter/material.dart';

void main() {
  runApp(
     MaterialApp(
      home: Scaffold(
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(colors:
              [
                Colors.deepPurple,Colors.purple
              ],
              ),
            ),
            child :Center(
              child: Text("First Flutter App")
          )
          )
      ),
    ),
  );
}
