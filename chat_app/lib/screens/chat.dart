import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget{
  ChatScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FlutterChat"),
      ),
      body: Center(
          child: Text("Logged In succesfully")
      ),
    );
    
  }
}