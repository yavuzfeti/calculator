import 'package:calculator/Components/Svg.dart';
import 'package:calculator/Components/Themes.dart';
import 'package:flutter/material.dart';

messageShow(String message,{String? icon,int? second}) async
=> ScaffoldMessenger.of(navKey.currentState!.context).showSnackBar(
    SnackBar(
      duration: Duration(seconds: second ?? 2),
      backgroundColor: icon == "success" ? Themes.success : icon == "warning" ? Themes.fail : Themes.color2,
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: Text(style: const TextStyle(color: Themes.light,fontSize: 15),message)),
          const SizedBox(width: 10),
          if (icon != null) Svg(icon:icon),
        ],
      ),
    ),
  );