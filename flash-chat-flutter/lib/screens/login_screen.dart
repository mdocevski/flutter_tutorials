import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/anims/anim_tags.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/constants.dart';
import 'package:flash_chat/components/rounded_button.dart';
import 'package:loading_overlay/loading_overlay.dart';

import 'chat_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String email;
  String password;
  bool isLoggingIn = false;

  @override
  Widget build(BuildContext context) {
    return LoadingOverlay(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Hero(
                tag: HeroTags.WELCOME_LOGO,
                child: Container(
                  height: 200.0,
                  child: Image.asset('images/logo.png'),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    this.email = value;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Enter your email',
                  )),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  this.password = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Enter your password.',
                ),
              ),
              SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                onPressed: () async {
                  try {
                    setState(() {
                      isLoggingIn = true;
                    });
                    final newUser = await _auth.signInWithEmailAndPassword(
                      email: email.trim(),
                      password: password.trim(),
                    );
                    setState(() {
                      isLoggingIn = false;
                    });
                    if (newUser != null) {
                      Navigator.pushNamed(context, ChatScreen.id);
                    }
                    print(newUser);
                  } catch (e) {
                    setState(() {
                      isLoggingIn = true;
                    });
                    print(e);
                  }
                },
                text: 'Log In',
                color: Colors.lightBlueAccent,
              ),
            ],
          ),
        ),
      ),
      isLoading: isLoggingIn,
    );
  }
}
