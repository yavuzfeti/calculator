import 'package:calculator/Components/Svg.dart';
import 'package:calculator/Components/Themes.dart';
import 'package:flutter/material.dart';

messageShow(String message,{int? second, Color? color}) async
=> ScaffoldMessenger.of(navKey.currentState!.context).showSnackBar(
    SnackBar(
      duration: Duration(seconds: second ?? 2),
      backgroundColor: color??Themes.color,
      content: Text(style: const TextStyle(color: Themes.light,fontSize: 15),message),
    ),
  );