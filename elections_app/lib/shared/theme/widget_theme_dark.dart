import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color_scheme.dart';

//// DARK MODe
ThemeData darkMode = ThemeData(
    scaffoldBackgroundColor: darkColorScheme.background,
    brightness: Brightness.dark,
    colorScheme: darkColorScheme,
    splashColor: darkColorScheme.primary,
    focusColor: darkColorScheme.primary,
    fontFamily: 'Noto Sans',
    textTheme: GoogleFonts.notoSansTextTheme(
      TextTheme(
        displayLarge: TextStyle(
          color: darkColorScheme.onBackground,
          fontWeight: FontWeight.w700,
          fontFamily: 'Noto Sans',
        ),
        displayMedium: TextStyle(
            color: darkColorScheme.onBackground,
            fontWeight: FontWeight.w700,
            fontFamily: 'Noto Sans'),
        displaySmall: TextStyle(
            color: darkColorScheme.onBackground,
            fontWeight: FontWeight.w700,
            fontFamily: 'Noto Sans'),
        headlineMedium: TextStyle(
            color: darkColorScheme.onBackground,
            fontWeight: FontWeight.w700,
            fontFamily: 'Noto Sans'),
        headlineSmall: TextStyle(
            color: darkColorScheme.onBackground, fontFamily: 'Noto Sans'),
        titleLarge: TextStyle(
            color: darkColorScheme.onBackground,
            fontFamily: 'Noto Sans',
            fontWeight: FontWeight.w700),
        titleMedium: TextStyle(
            color: darkColorScheme.onBackground, fontFamily: 'Noto Sans'),
        titleSmall: TextStyle(
            color: darkColorScheme.onBackground, fontFamily: 'Noto Sans'),
        bodyLarge: TextStyle(
            color: darkColorScheme.onSurface, fontFamily: 'Noto Sans'),
        bodyMedium: TextStyle(
            color: darkColorScheme.onBackground,
            fontFamily: 'Noto Sans',
            fontWeight: FontWeight.w600),
        labelLarge: TextStyle(
          color: darkColorScheme.onPrimary,
          fontFamily: 'Noto Sans',
        ),
      ),
    ),

    /// App Bar
    appBarTheme: AppBarTheme(
        color: Colors.transparent,
        titleTextStyle: TextStyle(
          color: darkColorScheme.onBackground,
        ),
        elevation: 0,
        iconTheme: IconThemeData(
          color: darkColorScheme.onBackground,
        )),

    /// Primary CTA button
    /// Primary CTA button
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            foregroundColor: lightColorScheme.onPrimary,
            backgroundColor: lightColorScheme.primary,
            textStyle: TextStyle(
              color: lightColorScheme.onPrimary,
              fontFamily: 'Noto Sans',
              fontWeight: FontWeight.w500,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 16),
            elevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
              25,
            )))),

    /// Snackbar
    snackBarTheme: SnackBarThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      behavior: SnackBarBehavior.floating,
      elevation: 5,
      backgroundColor: darkColorScheme.onPrimary,
    ),

    /// Icons
    iconTheme: IconThemeData(
      color: darkColorScheme.onBackground,
    ),

    /// List Tiles
    listTileTheme: ListTileThemeData(
        tileColor: Colors.transparent,
        visualDensity: VisualDensity.adaptivePlatformDensity),

    /// Chips
    chipTheme: ChipThemeData(
      backgroundColor: darkColorScheme.onBackground,
      pressElevation: 5,
    ),

    /// Forms and other input widgets
    inputDecorationTheme: InputDecorationTheme(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: darkColorScheme.surface),
        ),
        filled: true,
        hintStyle: const TextStyle(
            fontFamily: 'Noto Sans', fontWeight: FontWeight.bold),
        labelStyle: const TextStyle(
            fontFamily: 'Noto Sans ',
            fontWeight: FontWeight.w400,
            fontSize: 14),
        fillColor: darkColorScheme.surface,
        focusColor: darkColorScheme.onSurface,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: darkColorScheme.surface),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        )),
    bottomSheetTheme: BottomSheetThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        backgroundColor: darkColorScheme.surface),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.shifting,
        selectedIconTheme: IconThemeData(color: darkColorScheme.primary),
        unselectedIconTheme: IconThemeData(color: darkColorScheme.onPrimary),
        backgroundColor: darkColorScheme.surface.withOpacity(0.05),
        enableFeedback: true,
        unselectedLabelStyle: TextStyle(
            color: darkColorScheme.onBackground,
            fontFamily: 'Noto Sans ',
            fontSize: 12,
            fontWeight: FontWeight.w600),
        selectedLabelStyle: TextStyle(
          color: darkColorScheme.onBackground,
          fontFamily: 'Noto Sans ',
          fontSize: 12,
          fontWeight: FontWeight.w600,
        )));
