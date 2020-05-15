import 'package:flutter/material.dart';

class TwoSideRoundedBtton extends StatelessWidget {
  final String text;
  final double radius;
  final Function press;
  const TwoSideRoundedBtton({
    Key key,
    this.text,
    this.radius,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            color: Color(0xFFFF9800),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(radius),
              bottomRight: Radius.circular(radius),
            )),
        child: Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}