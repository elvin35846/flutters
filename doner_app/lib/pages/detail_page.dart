import 'package:doner_app/core/const.dart';
import 'package:doner_app/models/food_model.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final FoodModel data;

  DetailPage(this.data);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greenColor,
      body: Column(
        children: [
          SizedBox(height: 25),
          _customAppBar(),
          Container(
            height: 200,
            child: Stack(
              children: [
                Center(
                  child: Image(
                    image: AssetImage("assets/bg.png"),
                  ),
                ),
                Center(
                  child: Hero(
                    tag: "image${widget.data.imgPath}",
                    child: Image(
                      width: 200,
                      height: 200,
                      image: AssetImage("assets/${widget.data.imgPath}",),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25), topRight: Radius.circular(25)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${widget.data.name}",
                  style: TextStyle(fontSize: 30),
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Text(
                      "${widget.data.price.toInt()} azn",
                      style: TextStyle(fontSize: 28, color: AppColors.redColor),
                    ),
                    SizedBox(width: 30),
                    _buildCounter(),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildInfo("Weight: ", "${widget.data.weight.toInt()}gm"),
                    _buildInfo(
                        "Colories: ", "${widget.data.calory.toInt()}cal"),
                    _buildInfo("Protein: ", "${widget.data.protein.toInt()}gm"),
                  ],
                ),
                SizedBox(height: 16),
                Text(
                  "Items",
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 8),
                Text("${widget.data.item}"),
                Expanded(child: SizedBox()),
                Row(
                  children: [
                    Expanded(
                      child: RaisedButton(
                        onPressed: () {},
                        padding: EdgeInsets.all(14),
                        color: AppColors.greenColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                        ),
                        child: Text(
                          "Add to Card",
                          style: TextStyle(fontSize: 22),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }

  Widget _buildCounter() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.greenColor,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.remove, color: Colors.black, size: 20),
            onPressed: null,
          ),
          Text("1", style: TextStyle(fontSize: 26)),
          IconButton(
            icon: Icon(Icons.add, color: Colors.black, size: 20),
            onPressed: null,
          )
        ],
      ),
    );
  }

  Widget _buildInfo(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 18),
        ),
        Text(
          value,
          style: TextStyle(fontSize: 16, color: AppColors.redColor),
        ),
      ],
    );
  }

  Widget _customAppBar() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              child: Icon(Icons.chevron_left, size: 20),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            child: Icon(Icons.shop, size: 20),
          ),
        ],
      ),
    );
  }
}
