import 'package:calculator/Components/Splash.dart';
import 'package:calculator/Components/Themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Launch
{
  web(String url, {bool? i}) async => await launchUrlString(url, mode: i??false ? LaunchMode.inAppWebView : LaunchMode.platformDefault);

  go(StatefulWidget route) => Navigator.push(navKey.currentState!.context, MaterialPageRoute(builder: (context) => route));

  goNoBack(StatefulWidget route) => Navigator.pushReplacement(navKey.currentState!.context, MaterialPageRoute(builder: (context) => route));

  back({bool? status}) => Navigator.pop(navKey.currentState!.context,status);

  exit() => SystemNavigator.pop();

  goClear() => Navigator.pushAndRemoveUntil(
    navKey.currentState!.context,
    MaterialPageRoute(builder: (context) => const Splash()),
        (Route<dynamic> route) => false,
  );
}