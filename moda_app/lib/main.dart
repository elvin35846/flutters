import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Montserrat'),
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            "2020 Fashion",
            style: TextStyle(
              //fontFamily: 'Montserrat',
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.camera_alt_outlined),
              onPressed: () {},
              color: Colors.grey,
            )
          ],
        ),
        body: ListView(children: [
          //Top profile lists
          Container(
            width: double.infinity,
            height: 150,
            child: ListView(
              padding: EdgeInsets.all(12),
              scrollDirection: Axis.horizontal,
              children: [
                listElemet('assets/model1.jpeg', 'assets/chanellogo.jpg'),
                SizedBox(width: 20),
                listElemet('assets/model2.jpeg', 'assets/louisvuitton.jpg'),
                SizedBox(width: 20),
                listElemet('assets/model3.jpeg', 'assets/chloelogo.png'),
                SizedBox(width: 20),
                listElemet('assets/model1.jpeg', 'assets/chanellogo.jpg'),
                SizedBox(width: 20),
                listElemet('assets/model2.jpeg', 'assets/louisvuitton.jpg'),
                SizedBox(width: 20),
                listElemet('assets/model3.jpeg', 'assets/chloelogo.png'),
                SizedBox(width: 20),
                listElemet('assets/model1.jpeg', 'assets/chanellogo.jpg'),
                SizedBox(width: 20),
                listElemet('assets/model2.jpeg', 'assets/louisvuitton.jpg'),
                SizedBox(width: 20),
                listElemet('assets/model3.jpeg', 'assets/chloelogo.png'),
              ],
            ),
          ),

          //Card body
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Material(
              borderRadius: BorderRadius.circular(16),
              elevation: 4,
              child: Container(
                height: 450,
                width: double.infinity,
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  image: DecorationImage(
                                    image: AssetImage('assets/model1.jpeg'),
                                    fit: BoxFit.cover,
                                  )),
                            ),
                            SizedBox(width: 10),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Monica",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    "34 mins ago",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Icon(
                          Icons.more_vert,
                          color: Colors.grey,
                          size: 30,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }

  Widget listElemet(String imgPath, String logoPath) {
    return Column(
      children: [
        Stack(
          children: [
            //Main picture
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                image: DecorationImage(
                    image: AssetImage(imgPath), fit: BoxFit.cover),
              ),
            ),
            //Icon on picture
            Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    image: DecorationImage(
                        image: AssetImage(logoPath), fit: BoxFit.contain)),
              ),
            ),
          ],
        ),
        SizedBox(height: 16),
        Container(
          //alignment: Alignment.center,
          height: 30,
          width: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.brown,
          ),
          child: Center(
            child: Text(
              "Follow",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
