import 'package:flutter/material.dart';

const MaterialColor primary = MaterialColor(_primaryPrimaryValue, <int, Color>{
  50: Color(0xFFE4FBED),
  100: Color(0xFFBBF5D3),
  200: Color(0xFF8EEFB6),
  300: Color(0xFF61E899),
  400: Color(0xFF3FE383),
  500: Color(_primaryPrimaryValue),
  600: Color(0xFF1ADA65),
  700: Color(0xFF15D55A),
  800: Color(0xFF11D150),
  900: Color(0xFF0AC83E),
});
const int _primaryPrimaryValue = 0xFF1DDE6D;

const MaterialColor primaryAccent =
    MaterialColor(_primaryAccentValue, <int, Color>{
  100: Color(0xFFF3FFF6),
  200: Color(_primaryAccentValue),
  400: Color(0xFF8DFFA7),
  700: Color(0xFF74FF93),
});
const int _primaryAccentValue = 0xFFC0FFCE;

const MaterialColor secondary =
    MaterialColor(_secondaryPrimaryValue, <int, Color>{
  50: Color(0xFFFFF5E7),
  100: Color(0xFFFFE7C3),
  200: Color(0xFFFFD79B),
  300: Color(0xFFFFC773),
  400: Color(0xFFFFBB55),
  500: Color(_secondaryPrimaryValue),
  600: Color(0xFFFFA831),
  700: Color(0xFFFF9F2A),
  800: Color(0xFFFF9623),
  900: Color(0xFFFF8616),
});
const int _secondaryPrimaryValue = 0xFFFFAF37;

const MaterialColor secondaryAccent =
    MaterialColor(_secondaryAccentValue, <int, Color>{
  100: Color(0xFFFFFFFF),
  200: Color(_secondaryAccentValue),
  400: Color(0xFFFFE1C9),
  700: Color(0xFFFFD3AF),
});
const int _secondaryAccentValue = 0xFFFFFDFC;
