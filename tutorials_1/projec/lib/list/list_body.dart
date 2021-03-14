import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyListBody extends StatelessWidget {
  List<int> listTitle = List.generate(300, (index) => index);
  List<String> listSubtitle =
      List.generate(300, (index) => "List subtitle $index");

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: listTitle
          .map(
            (e) => Column(
              children: [
                Container(
                  child: Card(
                    color: Colors.teal.shade200,
                    margin: EdgeInsets.all(10),
                    elevation: 10,
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Icon(Icons.android),
                        radius: 12,
                      ),
                      title: Text("List title $e"),
                      subtitle: Text(listSubtitle[e]),
                      trailing: Icon(Icons.add_circle),
                    ),
                  ),
                ),
                Divider(
                  color: Colors.orange,
                  height: 10,
                  indent: 20,
                  endIndent: 20,
                ),
              ],
            ),
          )
          .toList(),
    );
  }
}
