import 'package:doner_app/core/const.dart';
import 'package:doner_app/models/food_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'dart:math' as math;

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<FoodModel> foodList = FoodModel.list;
  PageController pageController = PageController(viewportFraction: 0.8);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 50),
              child: Stack(children: [
                _buildRightBlock(),
              ]),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              width: 60,
              padding: EdgeInsets.only(top: 35, bottom: 15),
              color: AppColors.greenColor,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                        image: DecorationImage(
                            image: ExactAssetImage("assets/profile.jpg")),
                      ),
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.more_vert,
                          color: Colors.green.shade800,
                          size: 30,
                        ),
                      ),
                    )
                  ]),
            ),
            Positioned(
              bottom: 0,
              child: Transform.rotate(
                angle: -math.pi / 2,
                alignment: Alignment.topLeft,
                child: Row(
                  children: [
                    _buildMenu("Vegetables"),
                    _buildMenu("Chicken"),
                    _buildMenu("Beef"),
                    _buildMenu("Thai"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenu(String menuText) {
    return Container(
      width: 150,
      child: Center(
        child: Text(menuText, style: TextStyle(fontSize: 18)),
      ),
    );
  }

  Widget _buildRightBlock() {
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: Column(
        children: [
          _customeAppBar(),
          Expanded(
            child: ListView(
              children: [
                Container(
                  height: 300,
                  child: PageView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: foodList.length,
                    controller: pageController,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 30),
                        child: Stack(
                          children: [
                            _buildBackGround(index),
                            Align(
                              alignment: Alignment.topRight,
                              child: Transform.rotate(
                                angle: 120,
                                child: Image(
                                    width: 180,
                                    image: AssetImage(
                                        "assets/${foodList[index].imgPath}")),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 30,
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 12),
                                child: Text(
                                  "${foodList[index].price.toInt()} azn",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.redColor,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 32),
                  child: Text(
                    "Popular",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 40,
                    ),
                  ),
                ),
                _buildPopularList(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBackGround(int index) {
    return Container(
      margin: EdgeInsets.only(
        top: 40,
        bottom: 10,
        right: 40,
      ),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(24)),
        color: AppColors.greenColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: SizedBox()),
          Row(
            children: [
              RatingBarIndicator(
                rating: 3,
                itemBuilder: (context, index) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                itemCount: 5,
                itemSize: 16,
                direction: Axis.horizontal,
              ),
              SizedBox(width: 10),
              Text(
                "120 Reviews",
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
          Text(
            "${foodList[index].name}",
            style: TextStyle(fontSize: 26),
          ),
        ],
      ),
    );
  }

  Widget _buildPopularList() {
    return ListView.builder(
        padding: EdgeInsets.only(left: 40, top: 20, bottom: 16),
        shrinkWrap: true,
        itemCount: foodList.length,
        physics: ClampingScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.all(16),
            margin: EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12),
                topLeft: Radius.circular(12),
              ),
            ),
            child: Row(
              children: [
                Image(
                  width: 100,
                  image: AssetImage(
                    "assets/${foodList[index].imgPath}",
                  ),
                ),
                SizedBox(width: 18),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${foodList[index].name}",
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        "${foodList[index].price.toInt()} azn",
                        style:
                            TextStyle(fontSize: 24, color: AppColors.redColor),
                      ),
                      Text("(${foodList[index].weight.toString()}gm weight)"),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

  Widget _customeAppBar() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          RichText(
            text: TextSpan(
              text: "Hello, \n",
              style: TextStyle(color: Colors.black),
              children: [
                TextSpan(
                  text: "Shailee Weedly",
                  style: TextStyle(
                    color: AppColors.greenColor,
                    fontWeight: FontWeight.bold,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: AppColors.greenLightColor,
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: "Search foods"),
                    ),
                  ),
                  Icon(Icons.search),
                ],
              ),
            ),
          ),
          SizedBox(width: 16),
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            child: Center(
              child: Icon(Icons.shop),
            ),
          ),
        ],
      ),
    );
  }
}
