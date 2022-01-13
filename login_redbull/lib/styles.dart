import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class Styles {
  static const Color grey = Color.fromRGBO(212, 212, 212, 1);

  static TextStyle get textTitle =>
      GoogleFonts.getFont('Poppins', color: Styles.grey, fontSize: 14);
}
