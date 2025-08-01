import 'package:chat_app/widgets/new_message.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/widgets/chat_messages.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ChatScreenState();
  }

}

class _ChatScreenState extends State<ChatScreen>{

  void setupPushNotifications() async{
    final fcm = FirebaseMessaging.instance;
    await fcm.requestPermission();
    final token = await fcm.getToken();
  }

  @override
  void initState() {
    super.initState();
    final fcm = FirebaseMessaging.instance;
    setupPushNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FlutterChat"),
        actions: [
          IconButton(
              onPressed: (){
                FirebaseAuth.instance.signOut();
              },
              icon: Icon(
                  Icons.exit_to_app,
                  color: Theme.of(context).colorScheme.primary,
              )
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child:ChatMessages()
          ),
          NewMessage()
        ],
      )
    );
    
  }
}