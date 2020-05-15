import 'package:flutter/material.dart';

import '../consttants.dart';

class BookRaiting extends StatelessWidget {
  final double score;
  const BookRaiting({
    Key key,
    this.score,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
                return Container(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 6),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(3, 7),
                            blurRadius: 20,
                            color: Color(0xFD3D3D3D).withOpacity(.5))
                      ]),
                  child: Column(
                    children: <Widget>[
                      Icon(
                        Icons.star,
                        color: kIconColor,
                        size: 15,
                      ),
                      SizedBox(height: 5),
                      Text(
                        "4.9",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}