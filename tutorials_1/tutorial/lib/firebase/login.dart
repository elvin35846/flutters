import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseAuth _auth = FirebaseAuth.instance;

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  void initState() {
    super.initState();
    _auth.signOut();
    _auth.authStateChanges().listen((User user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login page"),
      ),
      body: Center(
        child: Column(
          children: [
            RaisedButton(
              onPressed: _createUser,
              color: Colors.blueAccent,
              child: Text("Email/Password User Create"),
            ),
            RaisedButton(
              onPressed: _loginUser,
              color: Colors.greenAccent,
              child: Text(
                "SignIn",
                style: TextStyle(color: Colors.black),
              ),
            ),
            RaisedButton(
              onPressed: _resetPassword,
              color: Colors.pinkAccent,
              child: Text(
                "Forgot Password",
                style: TextStyle(color: Colors.black),
              ),
            ),
            RaisedButton(
              onPressed: _updatePassword,
              color: Colors.purpleAccent,
              child: Text(
                "Update Password",
                style: TextStyle(color: Colors.black),
              ),
            ),
            RaisedButton(
              onPressed: _logoutUser,
              color: Colors.yellowAccent,
              child: Text(
                "SignOut",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _createUser() async {
    String _email = "elvin.marmocer@gmail.com";
    String _password = "35846Elvin";

    try {
      UserCredential _credential = await _auth.createUserWithEmailAndPassword(
          email: _email, password: _password);
      User _newUser = _credential.user;
      await _newUser.sendEmailVerification();
      if (_auth.currentUser != null) {
        debugPrint("Please check your email");
        await _auth.signOut();
      }
      debugPrint(_newUser.toString());
    } catch (e) {
      debugPrint("User create error: " + e.toString());
    }
  }

  void _loginUser() async {
    String _email = "elvin.marmocer@gmail.com";
    String _password = "35846Elvin";
    if (_auth.currentUser == null) {
      User _signInUser = (await _auth.signInWithEmailAndPassword(
              email: _email, password: _password))
          .user;
      debugPrint("------> User signin <------");
    } else {
      debugPrint("------> Signin user <------");
    }
  }

  void _logoutUser() async {
    if (_auth.currentUser != null) {
      await _auth.signOut();
      debugPrint("------> User signOut <------");
    } else {
      debugPrint("------> Not signin user <------");
    }
  }

  void _resetPassword() async {
    String _email = "elvin.marmocer@gmail.com";

    try {
      await _auth.sendPasswordResetEmail(email: _email);
      debugPrint("Reset pass link send to email: " + _email);
    } catch (e) {
      debugPrint("Reset password error: " + e);
    }
  }

  void _updatePassword() async {
    
    try {
      await _auth.currentUser.updatePassword("35846ne");
      debugPrint("Reset password success: ");
    } catch (e) {
      debugPrint("Reset password error: " + e);
    }
  }
}
