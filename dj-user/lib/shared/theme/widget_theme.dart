import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData darkTheme = ThemeData.dark().copyWith(

      /// Colors
      colorScheme: const ColorScheme.light(
          primary: Color.fromRGBO(5, 60, 91, 1),
          secondary: Color.fromRGBO(255, 212, 0, 1),
          onPrimary: Colors.white,
          background: Colors.white,
          onBackground: Color(0xFF212121),
          surface: Colors.white,
          secondaryContainer: Color.fromRGBO(226, 233, 239, 1),
          surfaceTint: Color.fromRGBO(44, 44, 44, 1),
          onSurface: Color(0xFF424242),
          error: Color.fromRGBO(207, 9, 20, 1),
          onError: Colors.white),
      // textButtonTheme: TextButtonThemeData(style: ButtonStyle(textStyle:
      //     MaterialStateProperty.resolveWith<TextStyle>(
      //         (Set<MaterialState> states) {
      //   // Default style for the button
      //   return GoogleFonts.lato(fontSize: 18);
      // }))),

      /// Icons
      iconTheme: const IconThemeData(color: Colors.white),

      /// Elevated Button
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromRGBO(5, 60, 91, 1),
             // textStyle: GoogleFonts.lato(fontSize: 18, color: Colors.white),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)))),

      /// AppBar
      appBarTheme: const AppBarTheme(
        backgroundColor:  Color(0xFF424242),
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
