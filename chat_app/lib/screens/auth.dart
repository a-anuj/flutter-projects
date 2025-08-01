import 'dart:io';

import 'package:chat_app/widgets/user_image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

final _firebase = FirebaseAuth.instance;
class AuthScreen extends StatefulWidget{
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() {
    return _AuthScreenState();
  }
}

class _AuthScreenState extends State<AuthScreen>{

  final _form = GlobalKey<FormState>();
  var _isLogin = true;
  var _enteredEmail = "";
  var _enteredPassword = "";
  File? _selectedImage;
  var _isAuthenticating = false;
  var _enteredUsername = "";

  void submit() async {
    final isValid = _form.currentState!.validate();
    if (!isValid || !_isLogin && _selectedImage == null) {
      return;
    }

    _form.currentState!.save();

    try {
      setState(() {
        _isAuthenticating = true;
      });
      if (_isLogin) {
        final userCredential = await _firebase.signInWithEmailAndPassword(
            email: _enteredEmail,
            password: _enteredPassword
        );
      } else {
        final userCredential = await _firebase.createUserWithEmailAndPassword(
            email: _enteredEmail,
            password: _enteredPassword
        );
        final storageRef = FirebaseStorage.instance
            .ref()
            .child('user_images')
            .child("${userCredential.user!.uid}.jpg");
        await storageRef.putFile(_selectedImage!);
        final imageUrl = await storageRef.getDownloadURL();
        await FirebaseFirestore.instance
            .collection('users')
            .doc(userCredential.user!.uid)
            .set({
            'username' : _enteredUsername,
            'email' : _enteredEmail,
            'image_url' : imageUrl,
        });
      }
    }
    on FirebaseAuthException catch (error) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(error.message ?? "Authentication Failed")));
      setState(() {
        _isAuthenticating = false;
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(
                  top: 30,
                  bottom: 20,
                  left: 20,
                  right: 20
                ),
                width: 200,
                child: Image.asset("assets/images/chat.png"),
              ),
              Card(
                margin: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Form(
                          key: _form,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (!_isLogin) UserImagePicker(onPickImage: (pickedImage){
                                _selectedImage = pickedImage;
                              },),
                              TextFormField(
                                decoration: InputDecoration(
                                  labelText: "Email Address"
                                ),
                                keyboardType: TextInputType.emailAddress,
                                autocorrect: false,
                                textCapitalization: TextCapitalization.none,
                                validator: (value){
                                  if(value==null || value.trim().isEmpty || !value.contains("@")){
                                    return "Please enter valid email address.";
                                  }
                                  return null;
                                },
                                onSaved: (value){
                                  _enteredEmail = value!;
                                },
                              ),
                              if (!_isLogin)
                                TextFormField(
                                  decoration: InputDecoration(
                                    labelText: "Username"
                                  ),
                                  validator: (value){
                                    if(value==null || value.trim().length<4 || value.isEmpty){
                                      return "Username must be 4 characters long";
                                    }
                                    return null;
                                  },
                                  onSaved: (value){
                                    _enteredUsername = value!;
                                  },
                                ),
                              TextFormField(
                                decoration: InputDecoration(
                                  labelText: "Password"
                                ),
                                obscureText: true,
                                validator: (value){
                                  if(value==null || value.trim().length<6){
                                    return "Password must be greater than 6 characters.";
                                  }
                                  return null;
                                },
                                onSaved: (value){
                                  _enteredPassword = value!;
                                },
                              ),
                              const SizedBox(height: 12,),
                              if (_isAuthenticating)
                                const CircularProgressIndicator(),
                              if (!_isAuthenticating)
                                ElevatedButton(
                                    onPressed: submit,
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Theme.of(context).colorScheme.primaryContainer
                                    ),
                                    child: Text(_isLogin? "Login" : "Signup")
                                ),
                              if (!_isAuthenticating)
                                TextButton(
                                    onPressed: (){
                                      setState(() {
                                        _isLogin = !_isLogin;
                                      });
                                    } ,
                                    child: Text(
                                        _isLogin
                                            ? "Create an account"
                                            : "Already have an account"
                                    )
                                )
                            ],
                          )
                      ),
                  ),
                ),

              )
            ],
          ),
        ),
      ),
    );
  }
}