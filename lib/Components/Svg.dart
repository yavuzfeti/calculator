import 'package:calculator/Components/Themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Svg extends StatelessWidget
{
  final String? icon;
  final String? image;
  final double? size;
  final Color? color;

  const Svg({super.key, this.size, this.color,this.icon,this.image});

  @override
  Widget build(BuildContext context)
  {
    return icon != null
        ? SvgPicture.asset("lib/Assets/Icons/$icon.svg",color: color ?? Themes.light,width: size ?? 35,height: size ?? 35)
        : SvgPicture.asset("lib/Assets/Images/${image??"logo"}.svg",color: color,width:size);
  }
}