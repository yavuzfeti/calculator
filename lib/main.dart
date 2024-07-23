import 'package:calculator/Components/Splash.dart';
import 'package:calculator/Components/Themes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();
  Themes.portrait();

  runApp(
    MaterialApp(
      builder: Themes.mediaQuery(),
      debugShowCheckedModeBanner: kDebugMode,
      title: "Hesap Makinesi",
      theme: Themes.theme,
      navigatorKey: navKey,
      home: const Splash(),
    ),
  );
}