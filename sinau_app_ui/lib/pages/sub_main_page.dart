import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sinau_app_ui/pages/items/home_page.dart';
import 'package:sinau_app_ui/pages/items/search_page.dart';

class SubMainPage extends StatefulWidget {
  SubMainPage({Key key}) : super(key: key);

  @override
  _SubMainPageState createState() => _SubMainPageState();
}

class _SubMainPageState extends State<SubMainPage> {
  int _currentIndex = 0;
  final tabs = [
    HomePage(),
    SearchPage(),
    Center(child: Text('Media')),
    Center(child: Text('User')),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  tabs[_currentIndex],
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  Widget buildBottomNavigationBar() {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
      child: BottomNavigationBar(
        elevation: 5,
        selectedItemColor: Color(0xffFF8181),
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            debugPrint('_currentIndex: ' + _currentIndex.toString());
          });
        },
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/icons/home.svg',
              color: _currentIndex == 0 ? Color(0xffFF8181) : Theme.of(context).focusColor,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/icons/search.svg',
              color: _currentIndex == 1 ? Color(0xffFF8181) : Theme.of(context).focusColor,
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/icons/media.svg',
              color: _currentIndex == 2 ? Color(0xffFF8181) : Theme.of(context).focusColor,
            ),
            label: 'Media',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/icons/user.svg',
              color: _currentIndex == 3 ? Color(0xffFF8181) : Theme.of(context).focusColor,
            ),
            label: 'User',
          ),
        ],
      ),
    );
  }
}
