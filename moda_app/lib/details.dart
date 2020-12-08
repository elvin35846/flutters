import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  final imgPath;
  Details({this.imgPath});

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Hero(
            tag: widget.imgPath,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(widget.imgPath), fit: BoxFit.cover)),
            ),
          ),
          Positioned(
            bottom: 15,
            left: 15,
            right: 15,
            child: Material(
              elevation: 4,
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              child: Container(
                padding: EdgeInsets.all(15),
                width: MediaQuery.of(context).size.width - 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 110,
                          width: 100,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                            image: DecorationImage(
                                image: AssetImage("assets/dress.jpg"),
                                fit: BoxFit.contain),
                          ),
                        ),
                        SizedBox(width: 15),
                        Expanded(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Laminated",
                                    style: TextStyle(fontSize: 28)),
                                SizedBox(height: 5),
                                Row(
                                  children: [
                                    Text("Fendi",
                                        style: TextStyle(fontSize: 18)),
                                    Image.asset("assets/fendi.png",
                                        width: 18, height: 18),
                                  ],
                                ),
                                SizedBox(height: 5),
                                Text(
                                    "One button V-neck sling long-sleeved waist female stitching dress.",
                                    style: TextStyle(fontSize: 12)),
                              ]),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Divider(),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                            text: TextSpan(
                                style: DefaultTextStyle.of(context).style,
                                children: [
                                  TextSpan(
                                      text: '\$',
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.black)),
                                  TextSpan(
                                      text: '6500',
                                      style: TextStyle(
                                          fontSize: 22, color: Colors.black))
                                ]),
                          ),
                          Container(
                            width: 30,
                            height: 30,
                            child: FloatingActionButton(
                              onPressed: () {},
                              child: Icon(
                                Icons.arrow_forward_rounded,
                                size: 15,
                              ),
                              backgroundColor: Colors.brown,
                            ),
                          ),
                        ]),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
