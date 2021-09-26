import 'package:flutter/material.dart';

class MainScreenWidget extends StatefulWidget {
  final bool status;
  MainScreenWidget({Key? key, required this.status}) : super(key: key);

  @override
  _MainScreenWidgetState createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  int _selectTab = 0;
  static const List<Widget> _widgetOptions = [
    Center(child: Text('Home page')),
    Center(child: Text('Films page')),
    Center(child: Text('TV series page')),
  ];
  void onSelectTab(int index) {
    setState(() {
      _selectTab = index;
    });
  }

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
                Navigator.of(context).pushNamed('/auth_page');
              })
        ],
        title: Image.asset(
          'assets/images/tmdb.png',
          width: 55,
          height: 40,
        ),
        centerTitle: true,
      ),
      body: _widgetOptions[_selectTab],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectTab,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.movie), label: 'Films'),
          BottomNavigationBarItem(icon: Icon(Icons.tv), label: 'TV series'),
        ],
        onTap: (index) {
          onSelectTab(index);
        },
      ),
    );
  }
}
