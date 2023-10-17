import 'dart:async';
import 'package:flutter/material.dart';
import 'package:moneymanager/screens/common_widget/money_manager.dart';
import 'package:moneymanager/screens/main_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) {
        return const MainPage();
      }));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: ColoredBox(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // moneymanager(40),
            Image.asset('assets/images/icons8-wallet.gif'),
            const SizedBox(height: 20,),
            moneymanager(20),
          ],
        ),
      )),
    );
  }
}
