import 'package:flutter/material.dart';
import 'package:lamp/lamp.dart';
import 'dart:async';

class ElFeneri extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FenerState();
  }
  
}

class FenerState extends State<ElFeneri> {
  bool _flashVarmi = false;
  bool _fenerAcikmi = false;
  double _siddeti = 1.0;
  String lamba = "closeLamp", btn = "ac";

  @override
  void initState() {
    super.initState();
    ilkAcilis();
  }

  ilkAcilis() async {
    bool _flashVarmi = await Lamp.hasLamp;
    setState(() {
      _flashVarmi = _flashVarmi;
    });
  }

  Future _feneriAc() async {
    if(_fenerAcikmi) {
      Lamp.turnOff();
      lamba = "closeLamp";
      btn = "ac";
    } else {
      Lamp.turnOn(intensity: _siddeti);
      lamba = "openLamp";
      btn = "kapat";
    }
    var v = await Lamp.hasLamp;
    setState(() {
      _flashVarmi = v;
      _fenerAcikmi = !_fenerAcikmi;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("El Feneri"),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset("assets/src/$lamba.png"),
          RaisedButton(
            onPressed: _feneriAc,
            child: Text("Feneri $btn"),
          ),
          Slider(
            value: _siddeti,
            onChanged: _fenerAcikmi ? _sidediDegistir : null,
          )
        ],
      ),
    );
  }

  _sidediDegistir(double deger) {
    Lamp.turnOn(intensity: deger);
    setState(() {
      _siddeti = deger;
    });
  }

}