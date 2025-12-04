import 'package:flutter/material.dart';

class AppFonts {
  static const String urbanist = 'Urbanist';

  // Font weights
  static const FontWeight thin = FontWeight.w100;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight black = FontWeight.w900;

  // Text styles with different weights
  static TextStyle urbanistThin({
    double fontSize = 14,
    Color? color,
    double? height,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      fontFamily: urbanist,
      fontWeight: thin,
      fontSize: fontSize,
      color: color,
      height: height,
      decoration: decoration,
    );
  }

  static TextStyle urbanistRegular({
    double fontSize = 14,
    Color? color,
    double? height,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      fontFamily: urbanist,
      fontWeight: regular,
      fontSize: fontSize,
      color: color,
      height: height,
      decoration: decoration,
    );
  }

  static TextStyle urbanistItalic({
    double fontSize = 14,
    Color? color,
    double? height,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      fontFamily: urbanist,
      fontWeight: regular,
      fontSize: fontSize,
      color: color,
      height: height,
      decoration: decoration,
      fontStyle: FontStyle.italic,
    );
  }

  static TextStyle urbanistSemiBold({
    double fontSize = 14,
    Color? color,
    double? height,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      fontFamily: urbanist,
      fontWeight: semiBold,
      fontSize: fontSize,
      color: color,
      height: height,
      decoration: decoration,
    );
  }

  static TextStyle urbanistBold({
    double fontSize = 14,
    Color? color,
    double? height,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      fontFamily: urbanist,
      fontWeight: bold,
      fontSize: fontSize,
      color: color,
      height: height,
      decoration: decoration,
    );
  }

  static TextStyle urbanistBoldItalic({
    double fontSize = 14,
    Color? color,
    double? height,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      fontFamily: urbanist,
      fontWeight: bold,
      fontSize: fontSize,
      color: color,
      height: height,
      decoration: decoration,
      fontStyle: FontStyle.italic,
    );
  }

  static TextStyle urbanistBlack({
    double fontSize = 14,
    Color? color,
    double? height,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      fontFamily: urbanist,
      fontWeight: black,
      fontSize: fontSize,
      color: color,
      height: height,
      decoration: decoration,
    );
  }
}

