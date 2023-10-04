import 'package:flutter/material.dart';
import 'package:moneymanager/screens/common_widget/money_manager.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final headname;
   CustomAppbar({this.headname,super.key});

  @override
  Size get preferredSize => const Size.fromHeight(100);

  @override
  Widget build(BuildContext context) {
    // TextTheme _textTheme=Theme.of(context).textTheme;
    return Container(
      width: double.infinity,
      color:Theme.of(context).primaryColor,
      height: 50,
      child: Stack(
        children: [
          IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(
                Icons.sort,
                size: 35,
              )),
          Center(child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              moneymanager(20),
            ],
          )),
         
        ],
      ),

      // child: IconButton(onPressed: (){
      //   Scaffold.of(context).openDrawer();
      // }, icon: Icon(Icons.abc)),
    );
  }
}
