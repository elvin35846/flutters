import 'package:flutter/material.dart';
import 'package:horoscope_app/models/horoscop.dart';
import 'package:horoscope_app/utils/strings_2.dart';

class HoroscopeList extends StatelessWidget {
  static List<Horoscop> allHoroscop;

  @override
  Widget build(BuildContext context) {
    allHoroscop = makeData();
    return Scaffold(
      appBar: AppBar(
        title: Text("Burçlar 2021"),
      ),
      body: listMake(),
    );
  }

  static List<Horoscop> makeData() {
    List<Horoscop> horoscopData = [];

    for (int i = 0; i < 12; i++) {
      String horoscopeSmallImg =
          Strings.BURC_ADLARI[i].toLowerCase() + "${i + 1}.png";
      String horoscopeBigImg =
          Strings.BURC_ADLARI[i].toLowerCase() + "_buyuk" + "${i + 1}.png";

      Horoscop addHoroscop = Horoscop(
          Strings.BURC_ADLARI[i],
          Strings.BURC_TARIHLERI[i],
          Strings.BURC_GENEL_OZELLIKLERI[i],
          horoscopeSmallImg,
          horoscopeBigImg);

      horoscopData.add(addHoroscop);
    }

    return horoscopData;
  }

  Widget listMake() {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return oneLinehoroscop(context, index);
      },
      itemCount: allHoroscop.length,
    );
  }

  Widget oneLinehoroscop(BuildContext context, int index) {
    Horoscop payloadDate = allHoroscop[index];

    return Card(
      elevation: 4,
      child: ListTile(
        onTap: ()=> Navigator.pushNamed(context, "/burcDetay/$index"),
        leading: Image.asset(
          "images/" + payloadDate.horoscopeSmallImg,
          width: 64,
          height: 64,
        ),
        title: Text(
          payloadDate.horoscopName,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w400,
            color: Colors.blue.shade500,
          ),
        ),
        subtitle: Text(
          payloadDate.horoscopeDate,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: Colors.blue,
        ),
      ),
    );
  }
}
