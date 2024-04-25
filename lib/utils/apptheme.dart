import 'package:cal_ads/utils/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData apptheme = ThemeData(
  inputDecorationTheme: InputDecorationTheme(
    hintStyle: GoogleFonts.lindenHill(
        color: Colorconstant.primerycolor,
        fontSize: 22,
        fontWeight: FontWeight.normal),
    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    filled: true,
    fillColor: Colorconstant.tertiarycolor,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide.none,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide.none,
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide.none,
    ),
  ),
);
