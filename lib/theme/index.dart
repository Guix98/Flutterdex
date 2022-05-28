import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';

MaterialColor PrimaryMaterialColor = MaterialColor(
  4293918720,
  <int, Color>{
    50: Color.fromRGBO(
      240,
      0,
      0,
      .1,
    ),
    100: Color.fromRGBO(
      240,
      0,
      0,
      .2,
    ),
    200: Color.fromRGBO(
      240,
      0,
      0,
      .3,
    ),
    300: Color.fromRGBO(
      240,
      0,
      0,
      .4,
    ),
    400: Color.fromRGBO(
      240,
      0,
      0,
      .5,
    ),
    500: Color.fromRGBO(
      240,
      0,
      0,
      .6,
    ),
    600: Color.fromRGBO(
      240,
      0,
      0,
      .7,
    ),
    700: Color.fromRGBO(
      240,
      0,
      0,
      .8,
    ),
    800: Color.fromRGBO(
      240,
      0,
      0,
      .9,
    ),
    900: Color.fromRGBO(
      240,
      0,
      0,
      1,
    ),
  },
);

ThemeData myTheme = ThemeData(
    primaryColor: pokeRed,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          pokeRed,
        ),
      ),
    ),
    colorScheme: ColorScheme.fromSwatch(primarySwatch: PrimaryMaterialColor)
        .copyWith(secondary: pokeRed),
    textTheme: GoogleFonts.changaTextTheme());
