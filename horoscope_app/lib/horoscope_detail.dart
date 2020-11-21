import 'package:flutter/material.dart';

import 'horoscope_list.dart';
import 'models/horoscop.dart';

class HoroscopeDetail extends StatelessWidget {
  int gelenIndex;
  Horoscop selectHoroscop;
  HoroscopeDetail(this.gelenIndex);
  @override
  Widget build(BuildContext context) {
    selectHoroscop = HoroscopeList.allHoroscop[gelenIndex];
    return Scaffold(
      body: CustomScrollView(
        primary: false,
        slivers: [
          SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            primary: true,
            backgroundColor: Colors.blue,
            title: Text(selectHoroscop.horoscopName),
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "images/" + selectHoroscop.horoscopeBigImg,
                fit: BoxFit.cover,
              ),
              title: Text("Burç ve Özellikleri"),
            ),
          ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
                padding: EdgeInsets.all(10),
                child: Text(
                  selectHoroscop.horoscopeInfo,
                  style: TextStyle(fontSize: 18, color: Colors.black),
                )),
          ),
        ],
      ),
    );
  }
}
