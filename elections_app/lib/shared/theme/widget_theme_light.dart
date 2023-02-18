import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color_scheme.dart';

///// LIGHT MODE
ThemeData lightMode = ThemeData(
    scaffoldBackgroundColor: lightColorScheme.background,
    brightness: Brightness.light,
    colorScheme: lightColorScheme,
    splashColor: lightColorScheme.primary,
    focusColor: lightColorScheme.primary,
    fontFamily: 'Noto Sans',
    textTheme: GoogleFonts.notoSansTextTheme(),
    primaryTextTheme: GoogleFonts.notoSansTextTheme(),

    /// App Bar
    appBarTheme: AppBarTheme(
        color: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: lightColorScheme.onBackground)),

    /// Primary CTA button
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            foregroundColor: lightColorScheme.onPrimary,
            backgroundColor: lightColorScheme.primary,
            shape: const StadiumBorder(),
            textStyle: TextStyle(
                fontFamily: 'Noto Sans',
                color: lightColorScheme.onPrimary,
                fontWeight: FontWeight.w700,
                fontSize: 18),
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 18),
            elevation: 0.5)),

    /// Snackbar
    snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.fixed,
        contentTextStyle:
            const TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
        elevation: 2,
        backgroundColor: lightColorScheme.onPrimary),

    /// Icons
    iconTheme: const IconThemeData(color: Colors.black),

    /// List Tiles
    listTileTheme: ListTileThemeData(tileColor: lightColorScheme.background),

    /// Chips
    chipTheme: ChipThemeData(
        backgroundColor: lightColorScheme.onBackground, pressElevation: 5),

    /// Forms and other input widgets
    inputDecorationTheme: InputDecorationTheme(
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: lightColorScheme.onPrimary),
            borderRadius: BorderRadius.circular(12)),
        errorMaxLines: 4,
        filled: true,
        fillColor: lightColorScheme.surface,
        focusColor: lightColorScheme.primary,
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: lightColorScheme.primary, width: 2),
            borderRadius: BorderRadius.circular(12)),
        contentPadding: const EdgeInsets.all(22),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: lightColorScheme.primary, width: 2),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        floatingLabelAlignment: FloatingLabelAlignment.start,
        border: OutlineInputBorder(
            borderSide: BorderSide(color: lightColorScheme.surface))),

    ///
    bottomSheetTheme:
        BottomSheetThemeData(backgroundColor: lightColorScheme.surface),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.shifting,
        selectedIconTheme: IconThemeData(color: lightColorScheme.primary),
        unselectedIconTheme: IconThemeData(color: lightColorScheme.onPrimary),
        backgroundColor: lightColorScheme.surface.withOpacity(0.05),
        enableFeedback: true,
        unselectedLabelStyle: TextStyle(
            color: lightColorScheme.onBackground,
            fontFamily: 'Noto Sans ',
            fontSize: 12,
            fontWeight: FontWeight.w600),
        selectedLabelStyle: TextStyle(
            color: lightColorScheme.onBackground,
            fontFamily: 'Noto Sans ',
            fontSize: 12,
            fontWeight: FontWeight.w700)));
