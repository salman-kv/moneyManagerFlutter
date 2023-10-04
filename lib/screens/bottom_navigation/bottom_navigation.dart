// import 'package:flutter/material.dart';

// class BottomNavigation extends StatefulWidget {
//   const BottomNavigation({super.key});

//   @override
//   State<BottomNavigation> createState() => _BottomNavigationState();
// }

// class _BottomNavigationState extends State<BottomNavigation>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(vsync: this);
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(items: [
//       BottomNavigationBarItem(icon: Icon(Icons.abc),label: 'aj'),
//       BottomNavigationBarItem(icon: Icon(Icons.abc),label: 'aj'),
//       BottomNavigationBarItem(icon: Icon(Icons.abc),label: 'aj'),
//     ]);
//   }
// }

import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:moneymanager/theme/theme_constants.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return  CurvedNavigationBar(
      // height: 55,
      index: 3,
      animationCurve: Curves.decelerate,
    backgroundColor:  const Color.fromARGB(255, 255, 255, 255),
    color:const Color.fromARGB(255, 0, 0, 0),
    animationDuration:const Duration(milliseconds: 500),
    items:const[
      CurvedNavigationBarItem(child: Icon(Icons.home,color: Colors.white,size: 30,),label:'Home',labelStyle:TextStyle(color: Colors.white)),
      CurvedNavigationBarItem(child: FaIcon(FontAwesomeIcons.moneyCheckDollar,color: Colors.white,),label:'Transaction',labelStyle:TextStyle(color: Colors.white)),
      CurvedNavigationBarItem(child: Icon(Icons.grid_view_sharp,color: Colors.white,size: 30),label:'Catogory',labelStyle:TextStyle(color: Colors.white)),
      CurvedNavigationBarItem(child: FaIcon(FontAwesomeIcons.chartPie,color: Colors.white,),label:'Graph',labelStyle:TextStyle(color: Colors.white)),
      CurvedNavigationBarItem(child: Icon(Icons.person,color: Colors.white,size: 30),label:'User',labelStyle:TextStyle(color: Colors.white)),
    ],
    onTap: (index) {
      print(index);
    },
    );
  }
}