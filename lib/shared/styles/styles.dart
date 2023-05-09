// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_app/shared/styles/palette.dart';

ThemeData lightMood = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    // backwardsCompatibility: false,
    systemOverlayStyle:SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark
    ),
    backgroundColor: Colors.white,
    iconTheme: IconThemeData(color:Colors.black87),
    elevation: 1.0,
    titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 22.0 ,
        fontWeight:FontWeight.bold,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedItemColor: Colors.deepPurpleAccent,
    unselectedItemColor: Colors.grey,
    elevation: 8.0,
    backgroundColor: Colors.white,
  ),
  textTheme: TextTheme(
    bodyText1: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
  ),
  primarySwatch: Palette.deepPurple,

);

ThemeData darkMood = ThemeData(
  scaffoldBackgroundColor: HexColor('333739'),
  appBarTheme: AppBarTheme(
    // backwardsCompatibility: false,
    systemOverlayStyle:SystemUiOverlayStyle(
      statusBarColor: HexColor('333739'),
      statusBarIconBrightness: Brightness.light,
    ),
    backgroundColor: HexColor('333739'),
    iconTheme: IconThemeData(color:Colors.white),
    elevation: 3.0,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 22.0 ,
      fontWeight:FontWeight.bold,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedItemColor: Colors.deepPurpleAccent,
    unselectedItemColor: Colors.grey,
    elevation: 120.0,
    backgroundColor: Colors.black12,
  ),
  textTheme: TextTheme(
    bodyText1: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
  ),
  primarySwatch: Palette.deepPurple,

);