import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class appDefaults extends StatelessWidget {

  final ThemeData customTheme = ThemeData(
    primaryColor: Colors.blue,
    fontFamily: GoogleFonts.lato().fontFamily,
    textTheme: TextTheme(
      titleLarge: TextStyle(fontSize: 100, fontWeight: FontWeight.bold, color: Colors.black,),
      bodyMedium: TextStyle(fontSize: 16),


    ),
    // Add more style properties as needed
  );

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}