
import 'package:flutter/material.dart';
Color containerColor=const Color.fromARGB(255, 234, 234, 234);
Color expenseColor=const Color.fromARGB(255, 114, 17, 17);
Color incomeColor=const Color.fromARGB(255, 16, 109, 14);
Color mainColor=const Color.fromARGB(255, 198, 180, 20);


ThemeData lightTheme=ThemeData(
  
  brightness: Brightness.light,
  primarySwatch:Colors.blueGrey,
  primaryColor: const Color.fromARGB(255, 235, 235, 235),
  fontFamily:'archivo narrow',
  

);
ThemeData darkTheme=ThemeData(
  
  brightness: Brightness.dark,
  primaryColor:const Color.fromARGB(255, 235, 235, 235),
  fontFamily:'archivo narrow'

);