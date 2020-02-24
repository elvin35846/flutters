import 'package:flutter/material.dart';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class KayitIshlemleri {
  //Dosya kayit yolunu aliyoruz
  Future<String> get dosyaYolu async {
    final konum = await getApplicationDocumentsDirectory();
    return konum.path;
  }

  //Dosyamizi olushturuyoruz
  Future<File> get yerelDosya async {
    final yol = await dosyaYolu;
    return File("$yol/yenidosya.txt");
  }

  //Dosya okuma ishlemleri
  Future<String> dosyaOku() async {
    try {
      final dosya = await yerelDosya;
      String icerik = await dosya.readAsString();
      return icerik;
    } catch (e) {
      return "Dosya okunmadi hata olushtu: $e";
    }
  }

  //Dosya yazma ishlemleri
  Future<File> dosyaYaz(String gelenIcerik) async {
    final dosya = await yerelDosya;
    return dosya.writeAsString(gelenIcerik);
  }
}

class Dosya extends StatefulWidget {
  final KayitIshlemleri kayitishlemi;

  const Dosya({Key key, this.kayitishlemi}) : super(key: key);
  @override
  State<StatefulWidget> createState() => DosyaState();
}

class DosyaState extends State<Dosya> {
  final yaziCtrl = TextEditingController();
  String veri = "";

  Future<File> veriKaydet() async {
    setState(() {
      veri = yaziCtrl.text;
    });

    return widget.kayitishlemi.dosyaYaz(veri);
  }

  @override
  void initState() {
    super.initState();
    
  }

  void dosyaOku() {
    widget.kayitishlemi.dosyaOku().then((String deger) {
      setState(() {
        veri = deger;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dosya islemleri"),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              hintText: "Dosyaya yazmak istediyinizi buraya yazin",
            ),
            controller: yaziCtrl,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: RaisedButton(
                    onPressed: veriKaydet,
                    color: Colors.green,
                    child: Text("Kaydet", style: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: RaisedButton(
                    onPressed: dosyaOku,
                    color: Colors.blue,
                    child: Text("Oku", style: TextStyle(color: Colors.white)),
                  ),
                ),
              )
            ],
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Text("$veri"),
            ),
          )
        ],
      ),
    );
  }
}
