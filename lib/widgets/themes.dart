import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context)=> ThemeData(
primarySwatch: Colors.deepPurple,
        fontFamily: GoogleFonts.poppins().fontFamily,
         cardColor: Colors.white,
          canvasColor: creamColor,
          
        appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
         titleTextStyle: TextStyle(color: Colors.black),
      
        )
        );

        static ThemeData darkTheme(BuildContext context) => ThemeData(
          brightness: Brightness.dark,
          fontFamily: GoogleFonts.poppins().fontFamily,
          cardColor: Colors.black,
          canvasColor: darkColor,
          
        appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.white),
         titleTextStyle: TextStyle(color: Colors.white),
         toolbarTextStyle: TextStyle(color: Colors.white)
         
        )
        );
  //Colors
  static Color darkColor = Vx.gray900;
  static Color creamColor = Color(0xfff5f5f5);
  static Color darkBluishColor = Color(0xff403b58);
  static Color lightBluishColor = Vx.purple400;
  }