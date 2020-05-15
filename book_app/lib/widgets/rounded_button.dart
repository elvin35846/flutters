import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function press;
  final double verticalPadding;
  final double fontSize;
  const RoundedButton({
    Key key,
    this.text,
    this.press,
    this.verticalPadding = 12,
    this.fontSize = 16,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: press,
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(vertical: 24),
          padding:
              EdgeInsets.symmetric(vertical: verticalPadding, horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.blue[300],
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 5),
                blurRadius: 5,
                color: Color(0xFF666666).withOpacity(.20),
              ),
            ],
          ),
          child: Text(
            text,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ));
  }
}