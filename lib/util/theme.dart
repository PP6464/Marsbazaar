import 'package:flutter/material.dart';

extension ColourExt on theme {
  Color get colour {
    switch (this) {
      case theme.teal:
        return const Color(0xFF18AD84);
      case theme.darkBlue:
        return const Color(0xFF242B69);
      case theme.black:
        return Colors.black;
      case theme.white:
        return Colors.white;
      case theme.red:
        return const Color(0xFFF53E5E);
      case theme.lightBlue:
        return const Color(0xFFE4E7FF);
    }
  }
}

// ignore: camel_case_types
enum theme {
  teal,
  darkBlue,
  white,
  black,
  red,
  lightBlue,
}
