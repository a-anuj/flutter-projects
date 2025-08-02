import 'package:flutter/material.dart';

class NewMessage extends StatefulWidget{
  const NewMessage({super.key});

  @override
  State<NewMessage> createState() {
    return _NewMessageState();
  }
}

class _NewMessageState extends State<NewMessage>{

  final _messageController = TextEditingController();

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  void submitMessage(){
    final enteredMessage = _messageController.text;

    if(enteredMessage.trim().isEmpty){
      return;
    }
    _messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 15,right: 1,bottom: 34),
        child: Row(
          children: [
            Expanded(
                child: TextField(
                  controller: _messageController,
                  textCapitalization: TextCapitalization.sentences,
                  autocorrect: true,
                  enableSuggestions: true,
                  decoration: InputDecoration(labelText: "Type a message here..."),
                )
            ),
            IconButton(
                color: Theme.of(context).colorScheme.primary,
                onPressed: submitMessage,
                icon: Icon(Icons.send)
            )
          ],
        ),
    );

  }
}