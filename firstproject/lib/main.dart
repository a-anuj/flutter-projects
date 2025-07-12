import 'package:flutter/material.dart';
import 'package:firstproject/gradient_container.dart';

void main() {
  runApp(
     MaterialApp(
      home: Scaffold(
          body:GradientContainer(colors:[Colors.deepOrange,Colors.orange])
      ),
    ),
  );
}

