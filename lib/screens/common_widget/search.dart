import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:moneymanager/db/function/catogory/catogory_db.dart';
import 'package:moneymanager/db/function/transaction/transaction_db.dart';
import 'package:moneymanager/screens/all_transaction/transaction.dart';
import 'package:moneymanager/theme/theme_constants.dart';

class Search extends StatelessWidget {
   Search({super.key});
  final searchText=TextEditingController();
  // final ValueNotifier<String> search=ValueNotifier('');

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        children: [
          SizedBox(
            height: 50,
            child: TextField( 
              onChanged: (value) {
                selectListener.value=0;
                if(value.isEmpty){
              CatogoryDb().refreshUi();
              TransactionDb().refreshUi();
                }
                else{
                   CatogoryDb().seearchRefresh(searchText.text);
                   TransactionDb().serarchrefreshUi(searchText.text);
                }           
              },
              controller: searchText,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: incomeColor)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.black)),
                  hintText: 'Search',
                  hintStyle: const TextStyle(
                      color: Color.fromARGB(105, 0, 0, 0), fontSize: 16),
                  prefixIcon:const Icon(Icons.search),
                  suffixIcon:  IconButton(onPressed: (){
                    searchText.text='';
                       TransactionDb().refreshUi();
                  }, icon: const Icon(Icons.close)), 
                  suffixIconColor: expenseColor),
            ),
          ),
        ],
      ),
    );
  }
}
