import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class Style {
  static BoxDecoration get cardDecoration => BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            offset: Offset(0.0, 2.0),
            blurRadius: 1.0,
          ),
        ],
      );

  static BoxDecoration get buttonDecoration => BoxDecoration(
        color: Style.primaryColor,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade400,
            offset: Offset(0.0, 1.0),
            blurRadius: 1.0,
          ),
        ],
      );

  static Color get iceBackground => const Color(0XFFF7F8FC);

  static TextStyle get bold => TextStyle(fontWeight: FontWeight.bold);

  static TextStyle get white => TextStyle(
        fontWeight: FontWeight.bold,
        letterSpacing: 1,
        color: Colors.white,
      );

  static TextStyle get titleFont => TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: detailDarkColor,
      letterSpacing: 1);

  static InputDecoration inputDecoration({String hint}) {
    return InputDecoration(
      errorText: null,
      hintText: hint,
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.red,
          width: 1.0,
        ),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Style.primaryColor,
          width: 1.0,
        ),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Style.secondaryColor,
            width: 1.0,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10))),
    );
  }

  static Color get primaryColor => Colors.indigo;
  static Color get secondaryColor => Colors.lightGreen;

  static Color get menuBackground => Color.fromRGBO(220, 224, 230, 1);
  static Color get detailColor => const Color(0XFFDCE0E6);
  static Color get detailDarkColor => const Color(0XFF828A99);
  static Color get detailDarkestColor => const Color(0XFF363E4D);

  static TextStyle get cardTitle => TextStyle(
        fontWeight: FontWeight.bold,
        color: Style.detailDarkestColor,
      );

  static TextStyle get cardSubTitle => TextStyle(
        color: Style.detailDarkColor,
      );

  static TextStyle get formSubTitle => TextStyle(
        fontWeight: FontWeight.bold,
        color: Style.detailDarkColor,
      );

  static TextStyle get cardText => TextStyle(
        color: Style.detailDarkestColor,
      );
}
