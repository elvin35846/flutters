import 'package:firebase_signin_signup_with_email_password/signup_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SignUpApp(),
  ));
}

class SignUpApp extends StatelessWidget {
  const SignUpApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SignUpPage();
  }
}