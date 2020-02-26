import 'package:flutter/material.dart';
import './arayuz/home.dart';
import './arayuz/hello.dart';
import './arayuz/scf.dart';
import './arayuz/alertTextField.dart';
import './arayuz/jsonkonusu.dart';
import 'arayuz/basithttp.dart';
import 'arayuz/localjsonkonusu.dart';
import 'arayuz/shared.dart';
import 'arayuz/dosya.dart';

void main() {
  runApp(new MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => ScaffolUyesi(),
      '/home': (context) => Home(),
      '/hello': (context) => Hello(),
      '/alertTextField': (context) => AlertTextField(),
      '/shared': (context) => Shared(),
      '/dosya': (context) => Dosya(kayitishlemi: KayitIshlemleri()),
      '/jsonkonusu': (context) => JsonKonusu(),
      '/localjsonkonusu': (context) => LokalJsonKonusu(),
      '/basithttp': (context) => BasitHttp(),
    },
  ));
}
