import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NavigationWork extends StatelessWidget {
  String header = "About page";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Navigation",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              padding: EdgeInsets.all(10),
              child: Text(
                "Home page",
                style: TextStyle(color: Colors.white, fontSize: 36),
              ),
              color: Colors.blue,
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutPage(header)),
                );
              },
              padding: EdgeInsets.all(10),
              child: Text(
                "About page",
                style: TextStyle(color: Colors.white, fontSize: 36),
              ),
              color: Colors.amber,
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => InfoPage()),
                );
              },
              padding: EdgeInsets.all(10),
              child: Text(
                "Info page",
                style: TextStyle(color: Colors.white, fontSize: 36),
              ),
              color: Colors.orangeAccent,
            )
          ],
        ),
      ),
    );
  }
}

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Info Page",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Geri geldiyinde veri getir",
              style: TextStyle(color: Colors.blue, fontSize: 36),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              color: Colors.pinkAccent,
              child: Text("Geri veri donder"),
            )
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home Page",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Home Page",
              style: TextStyle(color: Colors.blue, fontSize: 36),
            )
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class AboutPage extends StatelessWidget {
  String value;
  //AboutPage(this.value);
  AboutPage(String header) {
    value = header;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          value,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              value,
              style: TextStyle(color: Colors.blue, fontSize: 36),
            )
          ],
        ),
      ),
    );
  }
}
