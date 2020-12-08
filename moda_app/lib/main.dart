import 'package:flutter/material.dart';
import 'package:moda_app/details.dart';

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

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        bottomNavigationBar: Material(
          color: Colors.white,
          child: TabBar(controller: tabController, tabs: [
            Tab(
              icon: Icon(Icons.more, color: Colors.grey),
            ),
            Tab(
              icon: Icon(Icons.play_arrow, color: Colors.grey),
            ),
            Tab(
              icon: Icon(Icons.navigation, color: Colors.grey),
            ),
            Tab(
              icon: Icon(Icons.supervised_user_circle, color: Colors.grey),
            ),
          ]),
        ),
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
                listElemet('assets/model0.jpg', 'assets/fendi.jpg'),
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
              borderRadius: BorderRadius.circular(20),
              elevation: 4,
              child: Container(
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
                                    image: AssetImage('assets/model0.jpg'),
                                    fit: BoxFit.cover,
                                  )),
                            ),
                            SizedBox(width: 10),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Jill Kortleve",
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
                    SizedBox(height: 15),
                    Text(
                      "Breakout Dutch model Jill Kortleve made her runway debut at Alexander McQueen’s SS19 show – and went on to score a spot in that season’s campaign, too. ",
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    SizedBox(height: 15),
                    Row(children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  Details(imgPath: 'assets/modelgrid1.jpg')));
                        },
                        child: Hero(
                          tag: 'assets/modelgrid1.jpg',
                          child: Container(
                            height: 200,
                            width: (MediaQuery.of(context).size.width - 64) / 2,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  image: AssetImage("assets/modelgrid1.jpg"),
                                  fit: BoxFit.contain),
                            ),
                          ),
                        ),
                      ),
                      Column(children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Details(
                                    imgPath: 'assets/modelgrid2.jpeg')));
                          },
                          child: Hero(
                            tag: 'assets/modelgrid2.jpeg',
                            child: Container(
                              height: 95,
                              width:
                                  (MediaQuery.of(context).size.width - 64) / 2,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    image: AssetImage("assets/modelgrid2.jpeg"),
                                    fit: BoxFit.contain),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Details(
                                    imgPath: 'assets/modelgrid3.jpeg')));
                          },
                          child: Hero(
                            tag: 'assets/modelgrid3.jpeg',
                            child: Container(
                              height: 95,
                              width:
                                  (MediaQuery.of(context).size.width - 64) / 2,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    image: AssetImage("assets/modelgrid3.jpeg"),
                                    fit: BoxFit.contain),
                              ),
                            ),
                          ),
                        ),
                      ]),
                    ]),
                    SizedBox(height: 15),
                    Row(children: [
                      Container(
                        height: 24,
                        padding: EdgeInsets.only(left: 20, right: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.brown.withOpacity(0.3),
                        ),
                        child: Center(
                          child: Text(
                            "# Fendi",
                            style: TextStyle(color: Colors.brown, fontSize: 12),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        height: 24,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.brown.withOpacity(0.3),
                        ),
                        child: Center(
                          child: Text(
                            "# Jill Kortleve",
                            style: TextStyle(color: Colors.brown, fontSize: 12),
                          ),
                        ),
                      ),
                    ]),
                    SizedBox(height: 10),
                    Divider(),
                    SizedBox(height: 10),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              socialMedia(Icons.reply, '1.7k'),
                              SizedBox(width: 25),
                              socialMedia(Icons.comment, '255'),
                            ],
                          ),
                          socialMedia(Icons.favorite, '2.5k',
                              customColor: Colors.red),
                        ]),
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }

  Widget socialMedia(IconData icon, String text,
      {Color customColor = Colors.grey}) {
    return Row(children: [
      Icon(icon, size: 32, color: customColor),
      SizedBox(width: 5),
      Text(
        text,
        style: TextStyle(fontSize: 16),
      ),
    ]);
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
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.5, 0.5),
                        blurRadius: 6.0,
                      ),
                    ],
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
