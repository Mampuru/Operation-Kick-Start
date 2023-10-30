import 'package:flutter/material.dart';

const MaterialColor primaryblue = MaterialColor(_primarybluePrimaryValue, <int, Color>{
  50: Color(0xFFE0E5F2),
  100: Color(0xFFB3BDDF),
  200: Color(0xFF8091CA),
  300: Color(0xFF4D65B5),
  400: Color(0xFF2644A5),
  500: Color(_primarybluePrimaryValue),
  600: Color(0xFF001F8D),
  700: Color(0xFF001A82),
  800: Color(0xFF001578),
  900: Color(0xFF000C67),
});
const int _primarybluePrimaryValue = 0xFF002395;

const MaterialColor primaryblueAccent = MaterialColor(_primaryblueAccentValue, <int, Color>{
  100: Color(0xFF969BFF),
  200: Color(_primaryblueAccentValue),
  400: Color(0xFF303AFF),
  700: Color(0xFF1722FF),
});
const int _primaryblueAccentValue = 0xFF636BFF;