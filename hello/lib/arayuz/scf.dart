import 'package:flutter/material.dart';

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
            onPressed: () => print('Air it'),
          ),
          IconButton(
            icon: const Icon(Icons.playlist_add),
            tooltip: 'Restitch it',
            onPressed: () => print('Restitch it'),
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
            Container(
              padding: const EdgeInsets.all(8),
              child: const Text('He\'d have you all unravel at the'),
              color: Colors.teal[100],
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: const Text('Heed not the rabble'),
              color: Colors.teal[200],
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: const Text('Sound of screams but the'),
              color: Colors.teal[300],
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: const Text('Who scream'),
              color: Colors.teal[400],
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
