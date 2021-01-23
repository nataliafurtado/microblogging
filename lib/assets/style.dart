import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';

class Style {
  // DECORATION

  static BoxDecoration get cardDecoration => BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            offset: Offset(0.0, 1.0),
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

  static InputDecoration inputDecoration({String hint, String label}) {
    return InputDecoration(
      errorText: null,
      hintText: hint,
      labelText: label,
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

  // TEXTSTYLE

  static TextStyle get white => TextStyle(
        fontWeight: FontWeight.bold,
        letterSpacing: 1,
        color: Colors.white,
      );

  static TextStyle get titleFont => GoogleFonts.pacifico(
        fontSize: 20,
        letterSpacing: 0.7,
      );

  static TextStyle get cardTitle => TextStyle(
        fontWeight: FontWeight.bold,
        color: Style.detailDarkestColor,
      );

  static TextStyle get cardSubTitle => TextStyle(
        color: Style.detailDarkColor,
      );

  static TextStyle get cardText => TextStyle(
        color: Style.detailDarkestColor,
      );

  static TextStyle get formSubTitle => TextStyle(
        fontWeight: FontWeight.bold,
        color: Style.detailDarkColor,
      );

  // COLORS

  static Color get primaryColor => Colors.indigo;
  static Color get secondaryColor => Colors.lightGreen;

  static Color get menuBackground => Color.fromRGBO(220, 224, 230, 1);
  static Color get detailColor => const Color(0XFFDCE0E6);
  static Color get detailDarkColor => const Color(0XFF828A99);
  static Color get detailDarkestColor => const Color(0XFF363E4D);
  static Color get iceBackground => const Color(0XFFF7F8FC);
}
