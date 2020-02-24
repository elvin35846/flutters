import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Shared extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SharedState();
}

class SharedState extends State<Shared> {
  final isimController = TextEditingController();
  final soyisimController = TextEditingController();
  final genelControlcu = GlobalKey<FormState>();

  String isimStr = "";
  String soyIsimStr = "";
  bool kayitDurumuStr = false;
  int kayitNumarasiStr = 0;

  @override
  void dispose() {
    isimController.dispose();
    soyisimController.dispose();
    super.dispose();
  }

  void kayitYap(String gIsim, String gSoyIsim) async {
    final kayitAraci = await SharedPreferences.getInstance();

    if(genelControlcu.currentState.validate()){
      kayitAraci.setBool("durum", true);
      kayitAraci.setInt("kayitnumarasi", 1);
      kayitAraci.setString("isim", gIsim);
      kayitAraci.setString("soyisim", gSoyIsim);

      Fluttertoast.showToast(msg: "Kayit yapildi!", toastLength: Toast.LENGTH_LONG, gravity: ToastGravity.BOTTOM);
    }
  }
  void kayitGetir() async {
    final kayitAraci = await SharedPreferences.getInstance();

    String kayitliIsim = kayitAraci.getString("isim");
    String kayitliSoyisim = kayitAraci.getString("soyisim");
    bool kayitliDurum = kayitAraci.getBool("durum");
    int kayitNumarasi = kayitAraci.getInt("kayitnumarasi");

    setState(() {
      isimStr = kayitliIsim;
      soyIsimStr = kayitliSoyisim;
      kayitDurumuStr = kayitliDurum;
      kayitNumarasiStr = kayitNumarasi;
    });

    Fluttertoast.showToast(msg: "Kayit gosterildi!", toastLength: Toast.LENGTH_LONG, gravity: ToastGravity.BOTTOM);
  }
  void kayitSil() async {
    final kayitAraci = await SharedPreferences.getInstance();

    // tum kayitlari silmek icin kayitAraci.clear();

    //istediyimiz kayitlari silmek icin

    kayitAraci.remove("isim");
    kayitAraci.remove("soyisim");
    kayitAraci.remove("durum");
    kayitAraci.remove("kayitnumarasi");

    Fluttertoast.showToast(msg: "Kayit silindi!", toastLength: Toast.LENGTH_LONG, gravity: ToastGravity.BOTTOM);


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shared Preferance Kullanimi"),
      ),
      body: Form(
        key: genelControlcu,
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                validator: (deger) {
                  if (deger.length < 3) {
                    return "Lutfen isminizi en az 3 harfle yazin";
                  }
                },
                controller: isimController,
                decoration: InputDecoration(hintText: "Isminizi girin"),
              ),
              TextFormField(
                validator: (deger2) {
                  if (deger2.length < 3) {
                    return "Lutfen soyisminizi en az 3 harfle yazin";
                  }
                },
                controller: soyisimController,
                decoration: InputDecoration(hintText: "Soyisminizi girin"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: RaisedButton(
                        onPressed: () => kayitYap(isimController.text, soyisimController.text),
                        color: Colors.green,
                        child: Text(
                          "Kaydet",
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    )
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: RaisedButton(
                        onPressed: () => kayitGetir(),
                        color: Colors.blue,
                        child: Text(
                          "Getir",
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    )
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: RaisedButton(
                        onPressed: () => kayitSil(),
                        color: Colors.red,
                        child: Text(
                          "Sil",
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    )
                  )
                ],
              ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Isim: $isimStr"),
                          Text("Soyisim: $soyIsimStr"),
                          Text("Kayit Durumu: $kayitDurumuStr"),
                          Text("Kayit Numarasi: $kayitNumarasiStr")
                        ],
                      ),
                    ),
                  )
            ],
          ),
        ),
      ),
    );
  }
}
