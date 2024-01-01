import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

ColorScheme lightColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.light,
  seedColor: const Color.fromRGBO(54,32,93, 1),
  primary: const Color.fromRGBO(54,32,93, 1),
  onPrimary: const Color(0xFFffffff),
  background: const Color(0xFFffffff),
  onBackground: const Color.fromRGBO(0, 0, 0, 1),
  surface: const Color(0xffF5F5F5),
  onSurface: const Color(0xFF8B8B8B),
  error: const Color.fromRGBO(221,33,31, 1)
);

ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: lightColorScheme.background,
  brightness: Brightness.light,
  colorScheme: lightColorScheme,
  useMaterial3: true,
  splashColor: Colors.grey.shade100,
  focusColor: lightColorScheme.primary,
  textTheme: GoogleFonts.montserratTextTheme(),
  primaryTextTheme: GoogleFonts.montserratTextTheme(),

  appBarTheme: AppBarTheme(
    systemOverlayStyle: const SystemUiOverlayStyle(statusBarColor:  Color.fromRGBO(54,32,93, .7)),
    titleTextStyle: GoogleFonts.montserrat(
        color: const Color.fromRGBO(0, 0, 0, 1), fontWeight: FontWeight.w600, fontSize: 16),
    color: Colors.transparent,
    scrolledUnderElevation: 0.5,
    elevation: 0,
    iconTheme: const IconThemeData(
      color: Color.fromRGBO(0, 0, 0, 1),
    ),
  ),

  dialogTheme: DialogTheme(
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
        textStyle: GoogleFonts.montserrat(
          fontWeight: FontWeight.w700,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        foregroundColor: Colors.white,
        backgroundColor: lightColorScheme.primary,
        padding: const EdgeInsets.all(13),
        elevation: 0,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        alignment: Alignment.center,
        enableFeedback: true,
        side: const BorderSide(width: 0, color: Colors.transparent)),
  ),


  textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
          foregroundColor: const Color.fromRGBO(0, 0, 0, 1),
          elevation: 0,
          textStyle: GoogleFonts.montserrat(fontWeight: FontWeight.w500))),

  iconTheme: const IconThemeData(color: Color.fromRGBO(0, 0, 0, 1)),

  listTileTheme: ListTileThemeData(
      textColor: Colors.black,
      tileColor: Colors.transparent,
      titleTextStyle: GoogleFonts.montserrat(
        fontWeight: FontWeight.w400,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      iconColor: Colors.black
  ),

  chipTheme: ChipThemeData(
    backgroundColor: lightColorScheme.onBackground,
    pressElevation: 5,
  ),
  inputDecorationTheme: InputDecorationTheme(
    prefixIconColor: Colors.black,
    suffixIconColor: Colors.black,
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.grey, width: 0.8),
      borderRadius: BorderRadius.circular(8),
    ),
    errorMaxLines: 4,
    filled: true,
    fillColor: Colors.white,
    focusColor: lightColorScheme.primary,
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: lightColorScheme.primary, width: 2),
        borderRadius: BorderRadius.circular(8)),
    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: lightColorScheme.error, width: 2),
    ),
    floatingLabelBehavior: FloatingLabelBehavior.never,
    floatingLabelAlignment: FloatingLabelAlignment.start,
    border: OutlineInputBorder(
      borderSide: BorderSide(color: lightColorScheme.primary, width: 0.8),
      borderRadius: BorderRadius.circular(8),
    ),
  ),
  bottomSheetTheme:
  const BottomSheetThemeData(elevation: 1, shadowColor: Colors.grey),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.shifting,
    enableFeedback: true,
    selectedLabelStyle: GoogleFonts.montserrat(fontSize: 12),
    unselectedIconTheme: const IconThemeData(color: Color.fromRGBO(0, 0, 0, 0.4)),
    selectedIconTheme: const IconThemeData(color: Color.fromRGBO(0, 0, 0, 1)),
  ),
);