import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();

class Themes
{
  static const Color color = Colors.deepPurple;
  static const Color color2 = Colors.deepPurpleAccent;
  static const Color light = Colors.white;
  static const Color light2 = Colors.white54;
  static const Color grey = Colors.grey;
  static const Color dark = Color(0xff202020);
  static const Color success = Colors.green;
  static const Color fail  = Colors.redAccent;
  static const Color transparent = Colors.transparent;

  static Container div = Container(
    width: double.infinity,
    height: 1,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(35),
      color: grey,
    ),
  );

  static void portrait() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  static Widget Function(BuildContext, Widget?) mediaQuery() {
    return (context, child) {
      return MediaQuery(
        data: MediaQuery.of(context).copyWith(
          alwaysUse24HourFormat: true,
          textScaler: const TextScaler.linear(1.0),
        ),
        child: child!,
      );
    };
  }

  static double width = MediaQuery.sizeOf(navKey.currentState!.context).width;
  static double height = MediaQuery.sizeOf(navKey.currentState!.context).height;

  static ThemeData theme = ThemeData(
    useMaterial3: true,
    fontFamily: "Nunito",
    splashColor: transparent,
    indicatorColor: color,
    canvasColor: light,
    primaryColor: color,
    hintColor: color,
    disabledColor: grey,
    scaffoldBackgroundColor: light,

    pageTransitionsTheme: const PageTransitionsTheme(
        builders: <TargetPlatform,PageTransitionsBuilder>
        {
          TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
        }
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: color,width: 5),
        foregroundColor: light,
        disabledForegroundColor: grey,
        padding: EdgeInsets.zero,
      ),
    ),
    
    snackBarTheme: const SnackBarThemeData(
      elevation: 5,
      backgroundColor: color2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
    ),

    appBarTheme: const AppBarTheme(
      elevation: 0,
      centerTitle: true,
      color: dark,
    ),

    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: color2),
      bodyMedium: TextStyle(color: color2),
      bodySmall: TextStyle(color: color2),
      displayLarge: TextStyle(color: color2),
      displayMedium: TextStyle(color: color2),
      displaySmall: TextStyle(color: color2),
      headlineLarge: TextStyle(color: color2),
      headlineMedium: TextStyle(color: color2),
      headlineSmall: TextStyle(color: color2),
      titleLarge: TextStyle(color: color2),
      titleMedium: TextStyle(color: color2),
      titleSmall: TextStyle(color: color2),
      labelLarge: TextStyle(color: color2),
      labelMedium: TextStyle(color: color2),
      labelSmall: TextStyle(color: color2),
    ),
    colorScheme: const ColorScheme.light(
      primary: color2,
      onPrimary: Colors.white,
      secondary: color,
      onSecondary: Colors.black,
      error: fail,
      surface: light,
    ).copyWith(
      primary: color, surface: light),
  );
}