import 'package:flutter/material.dart';
import 'dart:ui';

@override
class cdContainer extends Container {
  final Widget child;
  final BorderRadius borderRadius;
  final List<Color> gradientColors;
  final double gradientRadius;
  final double blurSigmaX;
  final double blurSigmaY;
  final Color cardColor;
  final Color textColor;
  final Color contColor;
  final double fontSize;
  final FontWeight fontWeight;
  final Alignment alignment;


    cdContainer ({
    required this.child,
    this.contColor = Colors.transparent,
    this.alignment = Alignment.center,
    this.borderRadius = const BorderRadius.all(Radius.circular(10.0)),
    this.gradientColors = const [Colors.red, Colors.blue],
    this.gradientRadius = 1.2,
    this.blurSigmaX = 30.0,
    this.blurSigmaY = 30.0,
    this.cardColor = Colors.transparent,
    this.textColor = Colors.black,
    this.fontSize = 16.0,
    this.fontWeight = FontWeight.normal,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        gradient: RadialGradient(
          radius: gradientRadius,
          colors: gradientColors,
        ),
      ),
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: blurSigmaX, sigmaY: blurSigmaY),
          child: Card(
            color: cardColor,
            child: child,
          ),
        ),
      ),
    );
  }
}
