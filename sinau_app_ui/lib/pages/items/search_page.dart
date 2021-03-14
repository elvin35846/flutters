import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List _buttonList = [
    'Technology',
    'Business',
    'Finance',
    'Python',
    'Programming',
    'Swift',
    'React Native'
  ];
  List _searchData = [];

  // Fetch content from the json file
  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/cardData.json');
    final data = await json.decode(response);
    setState(() {
      _searchData = data["data"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Explore'),
        actions: [
          IconButton(icon: Icon(Icons.local_grocery_store_outlined), onPressed: () {})
        ],
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            color: Theme.of(context).primaryColor,
          ),
          Container(
            decoration: BoxDecoration(
            color: Theme.of(context).backgroundColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
          ),
          Container(
            width: 325,
            padding: EdgeInsets.only(top: 27),
            child: buildContainerSearch(context),
          )
        ],
      ),
    );
  }

  buildContainerSearch(BuildContext context) {
    return Column(children: [
      TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Theme.of(context).hintColor,
          contentPadding: EdgeInsets.all(15),
          hintText: 'Form placeholder',
          hintStyle: TextStyle(color: Color(0xff91919F)),
          suffixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10)),
        ),
      ),
      SizedBox(height: 18),
      Container(
        width: double.infinity,
        child: Text(
          'Browser Category',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      SizedBox(height: 18),
      buttonFilterBlock(),
      SizedBox(height: 23),
      Container(
        width: double.infinity,
        child: Text(
          'Recommended Courses',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      searchDataBuild(),
    ]);
  }

  // Search data resaul block
  searchDataBuild() {
    return FutureBuilder(
        future: readJson(),
        builder: (context, AsyncSnapshot<dynamic> snapshot) {
          return Expanded(
            child: ListView.builder(
                itemCount: _searchData.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(top: 15),
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Theme.of(context).unselectedWidgetColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 75,
                          height: 75,
                          decoration: BoxDecoration(
                              color: Color(0xffFF8181),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          child: Center(
                            child: Container(
                              width: 23,
                              height: 23,
                              decoration: BoxDecoration(
                                color: Color(0xffFF9696),
                                borderRadius: BorderRadius.circular(11.5),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _searchData[index]['title'],
                              style: TextStyle(fontSize: 12),
                            ),
                            SizedBox(height: 7),
                            Text(
                              _searchData[index]['subtitle'],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                            SizedBox(height: 7),
                            Row(
                              children: [
                                Icon(Icons.star,
                                    color: Color(0xffFFC960), size: 16),
                                SizedBox(width: 6),
                                Text(_searchData[index]['rating'],
                                    style: TextStyle(fontSize: 10)),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  child: Text('*',
                                      style: TextStyle(
                                          fontSize: 10,
                                          color: Color(0xff91919F))),
                                ),
                                Text(_searchData[index]['by'],
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: Color(0xff91919F))),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  child: Text('*',
                                      style: TextStyle(
                                          fontSize: 10,
                                          color: Color(0xff91919F))),
                                ),
                                Text(_searchData[index]['level'],
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: Color(0xff91919F))),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }),
          );
        });
  }

  // Search filter buttoms
  buttonFilterBlock() {
    return Container(
      width: double.infinity,
      child: Wrap(
        children: [
          for (var i = 0; i < _buttonList.length; i++)
            Container(
              margin: EdgeInsets.only(right: 15),
              child: TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  backgroundColor: Color(0xff6360FF),
                  primary: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                ),
                onPressed: () {},
                child: Text(
                  _buttonList[i],
                  style: TextStyle(fontSize: 10),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
