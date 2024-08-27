import 'package:calculator/Components/Themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitWaveSpinner(
        color: Themes.color,
        waveColor: Themes.color2,
        size: Themes.width/5,
      ),
    );
  }
}
