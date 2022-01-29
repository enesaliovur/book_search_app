import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final appThemeData = ThemeData(
    textTheme: textTheme,
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: colorScheme.background,
    ),
    scaffoldBackgroundColor: colorScheme.background,
    cardColor: colorScheme.background,
    primaryColor: colorScheme.primary,
    dividerColor: colorScheme.secondary,
    iconTheme: IconThemeData(color: colorScheme.primary));

final colorScheme = ColorScheme.light(
  primary: Color(0xFFFFFFFF),
  background: Color(0xFF263238),
  secondary: Color(0xFF9E9E9E),
  onBackground: Color(0xFFFFFFFF),
  onPrimary:  Color(0xFFFFC107),
  onSecondary: Color(0xFF2196F3),
 
);

final textTheme = TextTheme(
  headline1: GoogleFonts.roboto(
      fontSize: 96, fontWeight: FontWeight.w300, letterSpacing: -1.5),
  headline2: GoogleFonts.roboto(
      fontSize: 60, fontWeight: FontWeight.w300, letterSpacing: -0.5),
  headline3: GoogleFonts.roboto(fontSize: 48, fontWeight: FontWeight.w400),
  headline4: GoogleFonts.roboto(
      color: colorScheme.primary,
      fontSize: 34,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.25),
  headline5: GoogleFonts.roboto(fontSize: 24, fontWeight: FontWeight.w400),
  headline6: GoogleFonts.roboto(
      fontSize: 20, fontWeight: FontWeight.w500, letterSpacing: 0.15),
  subtitle1: GoogleFonts.roboto(
      fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.15),
  subtitle2: GoogleFonts.roboto(
      fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.1),
  bodyText1: GoogleFonts.roboto(
      fontSize: 16, fontWeight: FontWeight.w300, letterSpacing: 0.2),
  bodyText2: GoogleFonts.roboto(
      fontSize: 14, fontWeight: FontWeight.w300, letterSpacing: 0.2),
  button: GoogleFonts.roboto(
      fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 1.25),
).apply(bodyColor: colorScheme.onBackground);
