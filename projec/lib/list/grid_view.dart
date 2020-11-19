import 'package:flutter/material.dart';

class GridViewDersi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 100,
      
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),


      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          child: Container(
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(5, 5),
                  blurRadius: 5,
                ),
              ],
              color: Colors.teal[100 * ((index + 1) % 8)],
              //borderRadius: BorderRadius.all(Radius.circular(15)),
              //borderRadius: BorderRadius.circular(30),
              // borderRadius: BorderRadius.only(
              //   topLeft: Radius.circular(40),
              //   bottomRight: Radius.circular(40),
              // ),
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.orange,
                style: BorderStyle.solid,
                width: 5,
              ),
              gradient: LinearGradient(
                colors: [
                  Colors.blue,
                  Colors.orange,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              image: DecorationImage(
                image: AssetImage("assets/images/icons.png"),
                //scale: 0.5,
                //fit: BoxFit.contain,
              ),
            ),
            margin: EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                "Merhaba Flutter",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),
          ),
          onTap: () => debugPrint("Merhaba $index"),
        );
      },
    );
  }
}

/*

GridView.count(
      crossAxisCount: 2,
      //scrollDirection: Axis.horizontal,
      primary: false,
      padding: EdgeInsets.all(10),
      crossAxisSpacing: 20,
      mainAxisSpacing: 40,
      reverse: true,
      children: [
        Container(
          alignment: Alignment.center,
          color: Colors.teal.shade300,
          child: Text(
            "Merhaba flutter 1",
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.teal.shade300,
          child: Text(
            "Merhaba flutter 2",
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.teal.shade300,
          child: Text(
            "Merhaba flutter 3",
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.teal.shade300,
          child: Text(
            "Merhaba flutter 4",
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.teal.shade300,
          child: Text(
            "Merhaba flutter 5",
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.teal.shade300,
          child: Text(
            "Merhaba flutter 6",
            textAlign: TextAlign.center,
          ),
        ),
      ],
    )

    */
