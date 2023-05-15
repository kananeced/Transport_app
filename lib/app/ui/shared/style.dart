// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class APPSTYLE {
  // for style
  static TextStyle header1 = GoogleFonts.montserrat(
    fontSize: 17,
    fontWeight: FontWeight.bold,
  );
  static TextStyle header2 = GoogleFonts.montserrat(
    fontSize: 13,
  );
  static TextStyle header3 = GoogleFonts.montserrat(
    fontSize: 13,
  );
  static TextStyle body1 = GoogleFonts.montserrat(
    fontSize: 12,
  );
  static TextStyle body1Seconted =
      GoogleFonts.montserrat(fontSize: 12, color: APPSTYLE.SECOND_TEXT_COLOR);

  static TextStyle body2 = GoogleFonts.montserrat(
    fontSize: 11,
  );

  static TextStyle body3 = GoogleFonts.montserrat(
    color: APPSTYLE.SECOND_TEXT_COLOR,
    fontSize: 12,
  );

  // light theme

  static Color SCAFFOLD_BACGROUND_COLOR_LIGH = const Color(0xFFFFFFFF);
  static Color WHITE_COLOR = const Color(0xFFFFFFFF);
  static Color BLACK_COLOR = const Color.fromARGB(255, 0, 0, 0);
  static Color PRIMARY_COLOR_LIGH = const Color(0xFF059BE9);
  static Color DESABLE_COLOR = const Color.fromARGB(113, 214, 214, 214);
  static Color ON_CONTAINER_COLOR = const Color.fromARGB(255, 225, 225, 225);
  static Color SHADOW_COLOR = const Color.fromARGB(172, 236, 236, 236);
  static Color SECOND_TEXT_COLOR = const Color(0XFF7A7A7A);
  static Color BORDER_COLOR = const Color.fromARGB(255, 202, 201, 201);
  static Color RED_COLOR = const Color.fromARGB(255, 230, 59, 11);

  // dart theme

  static Color SCAFFOLD_BACGROUND_COLOR_DARK = const Color(0xFFF5F5F5);
  static Color PRIMARY_COLOR_DARK = const Color.fromARGB(255, 100, 123, 227);
}
