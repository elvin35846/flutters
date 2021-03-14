import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List _cardData = [];

  // Fetch content from the json file
  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/cardData.json');
    final data = await json.decode(response);
    setState(() {
      _cardData = data["data"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Row(
          children: [
            Image.asset(
              'assets/images/avatar.png',
              width: 40,
              height: 40,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome back",
                    style: TextStyle(fontSize: 10),
                  ),
                  Text(
                    "Poetri Lazuardi",
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.notifications_none_outlined), onPressed: () {})
        ],
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            color: Theme.of(context).primaryColor,
          ),
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height - 220,
            decoration: BoxDecoration(
                color: Theme.of(context).backgroundColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
          ),
          Container(
            padding: EdgeInsets.only(top: 27),
            width: 325,
            height: double.infinity,
            child: Column(
              children: [
                topCard(),
                SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    child: Text(
                      'Recommendation',
                      style: TextStyle(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(height: 14),
                  cardDataBuild(),
              ],
            ),
          )
        ],
      ),
    );
  }

  cardDataBuild() {
    return FutureBuilder(
        future: readJson(),
        builder: (context, AsyncSnapshot<dynamic> snapshot) {
          return Expanded(
            child: ListView.builder(
                itemCount: _cardData.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(top: 15),
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Theme.of(context).unselectedWidgetColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _cardData[index]['title'],
                              style: TextStyle(fontSize: 12),
                            ),
                            SizedBox(height: 7),
                            Text(
                              _cardData[index]['subtitle'],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                            SizedBox(height: 7),
                            Row(
                              children: [
                                Icon(Icons.star,
                                    color: Color(0xffFFC960), size: 16),
                                SizedBox(width: 6),
                                Text(_cardData[index]['rating'],
                                    style: TextStyle(fontSize: 10)),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  child: Text('*',
                                      style: TextStyle(
                                          fontSize: 10,
                                          color: Color(0xff91919F))),
                                ),
                                Text(_cardData[index]['by'],
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: Color(0xff91919F))),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  child: Text('*',
                                      style: TextStyle(
                                          fontSize: 10,
                                          color: Color(0xff91919F))),
                                ),
                                Text(_cardData[index]['level'],
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: Color(0xff91919F))),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(width: 20),
                        Container(
                          width: 75,
                          height: 75,
                          decoration: BoxDecoration(
                              color: Color(0xffFF8181),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          child: Center(
                            child: Container(
                              width: 23,
                              height: 23,
                              decoration: BoxDecoration(
                                color: Color(0xffFF9696),
                                borderRadius: BorderRadius.circular(11.5),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          );
        });
  }

  Widget topCard() {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Theme.of(context).unselectedWidgetColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Declarative interfaces for any \nApple Devices',
                      style: TextStyle(fontSize: 12)),
                  SizedBox(height: 6),
                  Text('IDR 850.000',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                ],
              ),
              Container(
                width: 60,
                height: 60,
                padding: EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Color(0xff6360FF),
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                child: Center(
                  child: Transform.rotate(
                    angle: 45 * 3.1415926535897932 / 180,
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xff7E7BFF),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 35,
                    height: 35,
                    padding: EdgeInsets.all(7.5),
                    decoration: BoxDecoration(
                      color: Color(0xffF1F1FA),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: SvgPicture.asset('assets/images/icons/icon1.svg'),
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Current Progress',
                          style: TextStyle(
                              color: Color(0xff91919F), fontSize: 10)),
                      Text('50%', style: TextStyle(fontSize: 14)),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    width: 35,
                    height: 35,
                    padding: EdgeInsets.all(7.5),
                    decoration: BoxDecoration(
                      color: Color(0xffF1F1FA),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: SvgPicture.asset('assets/images/icons/icon1.svg'),
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Current Progress',
                          style: TextStyle(
                              color: Color(0xff91919F), fontSize: 10)),
                      Text('50%', style: TextStyle(fontSize: 14)),
                    ],
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 15),
          Container(
            width: double.infinity,
            height: 15,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(25)),
                color: Color(0xffF1F1FA)),
            child: Align(
              alignment: Alignment.topLeft,
              child: Container(
                height: 15,
                width: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    color: Color(0xff7DC579)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
