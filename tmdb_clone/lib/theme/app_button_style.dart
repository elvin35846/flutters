import 'package:flutter/material.dart';

abstract class AppButtonStyle {
  static final ButtonStyle linkButton = ButtonStyle(
    foregroundColor: MaterialStateProperty.all(Color(0xFF01B4E4)),
    textStyle: MaterialStateProperty.all(TextStyle(fontSize: 16)),
  );
}
