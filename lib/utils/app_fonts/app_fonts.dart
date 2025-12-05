import 'package:flutter/material.dart';

class AppFonts {
  static const String urbanist = 'Urbanist';

  // Font weights
  static const FontWeight thin = FontWeight.w100;
  static const FontWeight extraLight = FontWeight.w200;
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight extraBold = FontWeight.w800;
  static const FontWeight black = FontWeight.w900;

  // Thin
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

  static TextStyle urbanistThinItalic({
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
      fontStyle: FontStyle.italic,
    );
  }

  // ExtraLight
  static TextStyle urbanistExtraLight({
    double fontSize = 14,
    Color? color,
    double? height,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      fontFamily: urbanist,
      fontWeight: extraLight,
      fontSize: fontSize,
      color: color,
      height: height,
      decoration: decoration,
    );
  }

  static TextStyle urbanistExtraLightItalic({
    double fontSize = 14,
    Color? color,
    double? height,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      fontFamily: urbanist,
      fontWeight: extraLight,
      fontSize: fontSize,
      color: color,
      height: height,
      decoration: decoration,
      fontStyle: FontStyle.italic,
    );
  }

  // Light
  static TextStyle urbanistLight({
    double fontSize = 14,
    Color? color,
    double? height,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      fontFamily: urbanist,
      fontWeight: light,
      fontSize: fontSize,
      color: color,
      height: height,
      decoration: decoration,
    );
  }

  static TextStyle urbanistLightItalic({
    double fontSize = 14,
    Color? color,
    double? height,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      fontFamily: urbanist,
      fontWeight: light,
      fontSize: fontSize,
      color: color,
      height: height,
      decoration: decoration,
      fontStyle: FontStyle.italic,
    );
  }

  // Regular / Italic (already exists)
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

  // Medium
  static TextStyle urbanistMedium({
    double fontSize = 14,
    Color? color,
    double? height,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      fontFamily: urbanist,
      fontWeight: medium,
      fontSize: fontSize,
      color: color,
      height: height,
      decoration: decoration,
    );
  }

  static TextStyle urbanistMediumItalic({
    double fontSize = 14,
    Color? color,
    double? height,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      fontFamily: urbanist,
      fontWeight: medium,
      fontSize: fontSize,
      color: color,
      height: height,
      decoration: decoration,
      fontStyle: FontStyle.italic,
    );
  }

  // SemiBold (already exists)
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

  static TextStyle urbanistSemiBoldItalic({
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
      fontStyle: FontStyle.italic,
    );
  }

  // Bold (already exists)
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

  // ExtraBold
  static TextStyle urbanistExtraBold({
    double fontSize = 14,
    Color? color,
    double? height,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      fontFamily: urbanist,
      fontWeight: extraBold,
      fontSize: fontSize,
      color: color,
      height: height,
      decoration: decoration,
    );
  }

  static TextStyle urbanistExtraBoldItalic({
    double fontSize = 14,
    Color? color,
    double? height,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      fontFamily: urbanist,
      fontWeight: extraBold,
      fontSize: fontSize,
      color: color,
      height: height,
      decoration: decoration,
      fontStyle: FontStyle.italic,
    );
  }

  // Black (already exists)
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
