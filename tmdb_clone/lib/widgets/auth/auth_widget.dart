import 'package:flutter/material.dart';
import 'package:tmdb_clone/theme/app_button_style.dart';
import 'package:tmdb_clone/widgets/main_screen/main_screen_widget.dart';

class AuthWidget extends StatefulWidget {
  AuthWidget({Key? key}) : super(key: key);

  @override
  _AuthWidgetState createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/images/tmdb.png',
          width: 55,
          height: 40,
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          _HeaderWidget(),
        ],
      ),
    );
  }
}

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = const TextStyle(
      fontSize: 16,
    );
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              'Login to your account',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Text(
            'To use the editing and features of the TMDb rating, as well as receive personalized recommendations, you must log into your account. If you don\'t have an account, registration is free and easy.',
            style: textStyle,
          ),
          TextButton(
              style: AppButtonStyle.linkButton,
              onPressed: () {},
              child: Text('Registration')),
          Text(
            'If you registered but did not receive a confirmation email.',
            style: textStyle,
          ),
          TextButton(
              style: AppButtonStyle.linkButton,
              onPressed: () {},
              child: Text('Confirm email')),
          _FormWidget(),
        ],
      ),
    );
  }
}

class _FormWidget extends StatefulWidget {
  _FormWidget({Key? key}) : super(key: key);

  @override
  __FormWidgetState createState() => __FormWidgetState();
}

class __FormWidgetState extends State<_FormWidget> {
  final _usernameTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  String? errorText;

  void _auth() {
    final username = _usernameTextController.text;
    final password = _passwordTextController.text;

    if (username == 'admin' && password == 'admin') {
      errorText = null;
      Navigator.of(context).push(MaterialPageRoute<bool>(builder: (context) => MainScreenWidget(status: true)));
      print('Username: $username\nPassword: $password');
    } else {
      errorText = 'Error username or password!';
    }

    setState(() {});
  }

  void _resetPassword() {
    print('Reset passord');
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = const TextStyle(
      fontSize: 16,
    );
    final inputDecoration = const InputDecoration(
      border: OutlineInputBorder(),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFF01B4E4), width: 2.0),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      isCollapsed: true,
    );
    final errorText = this.errorText;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (errorText != null)
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.red.shade200,
                borderRadius: BorderRadius.all(Radius.circular(5))),
            child: Text(
              errorText,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
          ),
        SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.only(bottom: 4),
          child: Text(
            'Username',
            style: textStyle,
          ),
        ),
        TextField(
          controller: _usernameTextController,
          decoration: inputDecoration,
        ),
        SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.only(bottom: 4),
          child: Text(
            'Password',
            style: textStyle,
          ),
        ),
        TextField(
          controller: _passwordTextController,
          decoration: inputDecoration,
          obscureText: true,
        ),
        SizedBox(height: 16),
        Row(
          children: [
            ElevatedButton(
              style: ButtonStyle(
                  //elevation: MaterialStateProperty.all(0.0),
                  backgroundColor: MaterialStateProperty.all(Color(0xFF01B4E4)),
                  textStyle: MaterialStateProperty.all(
                      TextStyle(fontSize: 16, fontWeight: FontWeight.w700))),
              onPressed: _auth,
              child: Text('Login'),
            ),
            SizedBox(width: 20),
            TextButton(
              style: AppButtonStyle.linkButton,
              onPressed: _resetPassword,
              child: Text('Reset password'),
            ),
          ],
        ),
      ],
    );
  }
}
