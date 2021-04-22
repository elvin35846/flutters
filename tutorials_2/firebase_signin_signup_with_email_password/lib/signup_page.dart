import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String email, password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In with Firebase'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextFormField(
              onChanged: (setEmail) {
                setState(() {
                  email = setEmail;
                });
              },
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Enter email..',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              onChanged: (setPass) {
                setState(() {
                  password = setPass;
                });
              },
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Enter password..',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  signUp();
                },
                child: Text('Sign up'),
                style: ElevatedButton.styleFrom(
                  textStyle: GoogleFonts.roboto(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


// Create user in firebase with email and password
  void signUp() {}
}
