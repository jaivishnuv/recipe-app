import 'package:ai_chat_bot_app/constant/const.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';


class ThemeClass {
  Color lightPrimaryColor = HexColor('#19bc99');
  Color darkPrimaryColor = HexColor('#1f9b71');
  Color secondaryColor = HexColor('#F86F03');
  Color accentColor = HexColor('#969696');
  Color focusColor = Colors.orange;

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    primaryColor: ThemeData.light().scaffoldBackgroundColor,

    // - - - - -Light Theme Elevated Button Styles - - - - -
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(
          const Size(double.infinity, 55),
        ),
        // side: MaterialStateProperty.resolveWith<BorderSide>(
        //     (states) => BorderSide(color: _themeClass.lightPrimaryColor)),
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (states) => _themeClass.lightPrimaryColor),
        shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
          (_) {
            return RoundedRectangleBorder(borderRadius: kBorderRadius);
          },
        ),
        textStyle: MaterialStateProperty.resolveWith(
          (states) => const TextStyle(fontWeight: FontWeight.normal, fontSize: 23),
        ),
        foregroundColor:
            MaterialStateProperty.all<Color>(Colors.white), //actual text color
      ),
    ),
    // - - - - - - - - - - - - - - -  - - - - -

    focusColor: Colors.orange,
    indicatorColor: Colors.grey.withOpacity(0.5),
    colorScheme: const ColorScheme.light().copyWith(
      primary: _themeClass.lightPrimaryColor,
      secondary: _themeClass.secondaryColor,
      tertiary: _themeClass.accentColor,
      primaryContainer: const Color(0xffe2f1f1),

      secondaryContainer: Colors.grey.shade300, // for shimmer container
      onSecondaryContainer: Colors.grey.shade400, // for shimmer container
      onSurface: Colors.black, // for appbar color - inverse of bg color
      background: Colors.white, // normal background color white and black
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    primaryColor: ThemeData.dark().scaffoldBackgroundColor,
    focusColor: Colors.orange,
    indicatorColor: Colors.grey.withOpacity(0.5),
    colorScheme: const ColorScheme.dark().copyWith(
      primary: _themeClass.darkPrimaryColor,
      secondary: _themeClass.secondaryColor,
      tertiary: _themeClass.accentColor,
      primaryContainer: const Color(0xff374a4a),
      secondaryContainer: Colors.grey.shade900, // for shimmer container
      onSecondaryContainer: Colors.grey.shade700, // for shimmer container
      onSurface: Colors.white, // for appbar color - inverse of bg color
      background:
          HexColor('#2a2b2b'), // normal background color white and black
    ),
  );
}

ThemeClass _themeClass = ThemeClass();