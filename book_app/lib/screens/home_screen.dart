import 'package:book_app/widgets/book_raiting.dart';
import 'package:flutter/material.dart';

import '../consttants.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/main_page_bg.png"),
          alignment: Alignment.topCenter,
          fit: BoxFit.fitWidth,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: size.height * .1),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: RichText(
              text: TextSpan(
                style: Theme.of(context).textTheme.headline4,
                children: [
                  TextSpan(text: "What are you \n reading "),
                  TextSpan(
                    text: "today?",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 30),
          Container(
            height: 245,
            width: 202,
            child: Stack(
              children: <Widget>[
                Positioned(
                  left: 0,
                  bottom: 0,
                  right: 0,
                  child: Container(
                    height: 221,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(29),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 10),
                            blurRadius: 33,
                            color: kShadowColor,
                          ),
                        ]),
                  ),
                ),
                Image.asset(
                  "assets/images/book-1.png",
                  width: 150,
                ),
                Positioned(
                  top: 35,
                  right: 10,
                  child: Column(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.favorite_border),
                        onPressed: () {},
                      ),
                      BookRaiting(score: 4.9)
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}


