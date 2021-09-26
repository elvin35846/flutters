import 'package:flutter/material.dart';
import 'package:flutter/src/material/theme_data.dart';
import 'package:tmdb_clone/theme/app_color.dart';
import 'package:tmdb_clone/theme/iTheme.dart';

class LightTheme extends ITheme {
  static LightTheme? _instance;
  static LightTheme get instance {
    if (_instance != null) return _instance!;
    _instance = LightTheme._init();
    return _instance!;
  }

  LightTheme._init();

  final ThemeData _lightTheme = ThemeData.light();

  @override
  ThemeData get data => ThemeData(
        appBarTheme: _lightTheme.appBarTheme.copyWith(
          backgroundColor: AppColor.mainColor,
        ),
        bottomNavigationBarTheme: _lightTheme.bottomNavigationBarTheme.copyWith(
          backgroundColor: AppColor.mainColor,
          selectedItemColor: AppColor.selectNavBarIconColor,
          unselectedItemColor: AppColor.unselectNavBarIconColor,
        ),
        colorScheme: _lightTheme.colorScheme
            .copyWith(primary: Colors.blue, onPrimary: Colors.white),
      );
}
