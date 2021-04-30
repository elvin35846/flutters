import 'package:flutter/material.dart';
import 'package:tmdb_clone/widgets/auth/auth_widget.dart';

class MainScreenWidget extends StatefulWidget {
  final bool status;
  MainScreenWidget({Key? key, required this.status}) : super(key: key);

  @override
  _MainScreenWidgetState createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.menu,
        ),
        actions: [
          IconButton(
              icon: widget.status == false
                  ? Icon(Icons.login, color: Colors.white)
                  : Icon(Icons.person, color: Colors.white),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute<void>(
                    builder: (context) => AuthWidget()));
              })
        ],
        title: Image.asset(
          'assets/images/tmdb.png',
          width: 55,
          height: 40,
        ),
        centerTitle: true,
      ),
    );
  }
}
