
import 'package:flutter/material.dart';
Color containerColor=const Color.fromARGB(255, 234, 234, 234);
Color expenseColor=const Color.fromARGB(255, 220, 17, 2);
Color incomeColor=const  Color.fromARGB(255, 2, 188, 8);
Color mainColor=const Color.fromARGB(255, 198, 180, 20);
Color backgroundPurple=Color.fromARGB(255, 255, 255, 255);


ThemeData lightTheme=ThemeData(
  
  brightness: Brightness.light,
  primarySwatch:Colors.blueGrey,
  primaryColor:const Color.fromARGB(255, 231, 226, 226),
  fontFamily:'archivo narrow',
  scaffoldBackgroundColor:backgroundPurple,
  textTheme:const TextTheme(
    bodyLarge: TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.bold
    )
  )
  

);
ThemeData darkTheme=ThemeData(
  
  brightness: Brightness.dark,
  primaryColor:const Color.fromARGB(255, 235, 235, 235),
  fontFamily:'archivo narrow'

);