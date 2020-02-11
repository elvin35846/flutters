import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ScaffolUyesi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.greenAccent.shade100,
      appBar: new AppBar(
        title: const Text('AppBar Demo'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.playlist_play),
            tooltip: 'Air it',
            onPressed: () => Navigator.pushNamed(context, '/home'),
          ),
          IconButton(
            icon: const Icon(Icons.playlist_add),
            tooltip: 'Restitch it',
            onPressed: () => Navigator.pushNamed(context, '/hello'),
          ),
          IconButton(
            icon: const Icon(Icons.playlist_add_check),
            tooltip: 'Repair it',
            onPressed: () => print('Repair it'),
          )
        ],
      ),
      body: new Center(
        child: new GridView.count(
        primary: false,
        padding: const EdgeInsets.all(10),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: <Widget>[
            new GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/'),
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage('https://i.ytimg.com/vi/Qw4_922hdUI/maxresdefault.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              padding: const EdgeInsets.all(20),
              alignment: Alignment.bottomCenter,
              child: Transform(
                alignment: Alignment.bottomCenter,
                transform: Matrix4.skewY(0.0)..rotateZ(0.0),
                child: Container(
                  padding: EdgeInsets.all(20.0),
                  color: Color(0xFFFFFFFF),
                  child: new Text('Tek tiklama - Ilk sayfaya git', textAlign: TextAlign.center),
                ),
              ),
              ),
            ),
            new GestureDetector(
              onDoubleTap: () => Navigator.pushNamed(context, '/home'),
              child: Container(
              padding: const EdgeInsets.all(8),
              child: const Text('Chift tiklama - Home sayfasina git'),
              alignment: Alignment.center,
              color: Colors.teal[200],
              ),
            ),
            new GestureDetector(
              onLongPress: () => Navigator.pushNamed(context, '/hello'),
              child: Container(
              padding: const EdgeInsets.all(8),
              child: const Text('Uzun basma - Hello sayfasina git'),
              alignment: Alignment.center,
              color: Colors.teal[300],
              ),
            ),
            new GestureDetector(
              onDoubleTap: () {
                Fluttertoast.showToast(
                  msg: "Bu uyeye ikidefe tikladiz",
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.BOTTOM,
                  backgroundColor: Colors.white,
                  textColor: Colors.black,
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage('https://media.geeksforgeeks.org/wp-content/uploads/Toast.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              padding: const EdgeInsets.all(8),
              child: const Text('Show Bottom Toast'),
              alignment: Alignment.center,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: const Text('Revolution is coming...'),
              color: Colors.teal[500],
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: const Text('Revolution, they...'),
              color: Colors.teal[600],
            ),
          ],
        )
      ),
      bottomNavigationBar: new BottomNavigationBar(
        items: [
          new BottomNavigationBarItem(
            icon: new Icon(Icons.archive),
            title: new Text("Archive", textDirection: TextDirection.ltr),
          ),
          new BottomNavigationBarItem(
            icon: new Icon(Icons.announcement),
            title: new Text("Bilgilendirme", textDirection: TextDirection.ltr),
          ),
          new BottomNavigationBarItem(
            icon: new Icon(Icons.assessment),
            title: new Text("Deyerlendirme", textDirection: TextDirection.ltr),
          ),
        ],
        onTap: (int i) {
          switch (i) {
            case 0:
              debugPrint("Archive");
              break;
            case 1:
              debugPrint("Bilgilendirme");
              break;
            case 2:
              debugPrint("Deyerlendirme");
              break;
            default:
              debugPrint("Buttonun ismi bulunamadi");
              break;
          }
        }),
        drawer: new Drawer(
          child: new ListTile(
            leading: Icon(Icons.change_history),
            title: Text("My Drawer"),
            onTap: () {
                Navigator.pop(context);
                debugPrint("Close My Drawer");
              },
            ),
        ),
      );
  }
}
