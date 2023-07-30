import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData darkTheme = ThemeData.light().copyWith(

      /// Colors
      colorScheme: ColorScheme.light(
          primary: Colors.blue,
          secondary: Colors.grey.shade800,
          onPrimary: Colors.white,
          background: Colors.white,
          onBackground: const Color(0xFF212121),
          surface: Colors.white,
          secondaryContainer: const Color.fromRGBO(226, 233, 239, 1),
          surfaceTint: const Color.fromRGBO(44, 44, 44, 1),
          onSurface: const Color(0xFF424242),
          error: const Color.fromRGBO(207, 9, 20, 1),
          onError: Colors.white),

      /// Icons
      iconTheme: const IconThemeData(color: Colors.white),

      inputDecorationTheme: InputDecorationTheme(
          focusColor: Colors.white,
          contentPadding: const EdgeInsets.all(25),
          filled: true,
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10.0)),
          fillColor: Colors.blue.shade100),
      /// Elevated Button
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
             // textStyle: GoogleFonts.lato(fontSize: 18, color: Colors.white),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)))),

      /// AppBar
      appBarTheme: const AppBarTheme(
        // backgroundColor:  Color(0xFF424242),
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(fontSize: 24),
          iconTheme: IconThemeData(color: Colors.white)),

      /// Date Picker
      datePickerTheme: DatePickerThemeData(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),

      /// Buttons
      buttonTheme: const ButtonThemeData(textTheme: ButtonTextTheme.primary),


      /// Chip
      chipTheme: ChipThemeData(
          backgroundColor: Colors.grey.shade700, shape: const CircleBorder()),

      /// TextTheme
      );
}
