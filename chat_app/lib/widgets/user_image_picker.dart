import 'package:flutter/material.dart';

class UserImagePicker extends StatefulWidget{
  const UserImagePicker({super.key});

  @override
  State<StatefulWidget> createState() {
        return _UserImagePicketState();
  }
}

class _UserImagePicketState extends State<UserImagePicker>{
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.grey,
        ),
        TextButton.icon(
          onPressed: (){},
          icon:Icon(Icons.image),
          label: Text(
            "Add Image",
            style: TextStyle(
                color: Theme.of(context).colorScheme.primary)
            ,)
          ,)
      ],
    );

  }
}