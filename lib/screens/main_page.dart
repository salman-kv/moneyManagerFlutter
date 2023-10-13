import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:moneymanager/screens/account_screen/account_screen.dart';
import 'package:moneymanager/screens/all_transaction/transaction.dart';
import 'package:moneymanager/screens/app_bar/custom_appbar_main.dart';
import 'package:moneymanager/screens/catogory/catogory_income.dart';
import 'package:moneymanager/screens/drawer/drawer_page.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:moneymanager/screens/graph/graph_screen.dart';
import 'package:moneymanager/screens/home_screen/home_page.dart';

//main page here i want to change the body and the appbar name

class MainPage extends StatefulWidget {
  MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int val = 0;
  final pages = const [
    HomePage(),
    AllTransactionScreen(),
    GraphScreen(),
    CatogoryIncome(),

    //  AccountScreen(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppbar(),
        drawer: DrawerPage(
          texTheme: Theme.of(context).textTheme,
        ),
        body: pages[val],
        bottomNavigationBar: CurvedNavigationBar(
          index: val,
          animationCurve: Curves.decelerate,
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          color: const Color.fromARGB(255, 0, 0, 0),
          animationDuration: const Duration(milliseconds: 500),
          items: const [
            CurvedNavigationBarItem(
                child: Icon(
                  Icons.home,
                  color: Colors.white,
                  size: 30,
                ),
                label: 'Home',
                labelStyle: TextStyle(color: Colors.white)),
            CurvedNavigationBarItem(
                child: FaIcon(
                  FontAwesomeIcons.moneyCheckDollar,
                  color: Colors.white,
                ),
                label: 'Transaction',
                labelStyle: TextStyle(color: Colors.white)),

            CurvedNavigationBarItem(
                child: FaIcon(
                  FontAwesomeIcons.chartPie,
                  color: Colors.white,
                ),
                label: 'Graph',
                labelStyle: TextStyle(color: Colors.white)),
            CurvedNavigationBarItem(
                child:
                    Icon(Icons.grid_view_sharp, color: Colors.white, size: 30),
                label: 'Catogory',
                labelStyle: TextStyle(color: Colors.white)),

            // CurvedNavigationBarItem(
            //     child: Icon(Icons.person, color: Colors.white, size: 30),
            //     label: 'User',
            //     labelStyle: TextStyle(color: Colors.white)),
          ],
          onTap: (index) {
            setState(() {
              val = index;
            });
          },
        ),
      ),
    );
  }
}
