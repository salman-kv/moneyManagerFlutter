import 'package:flutter/material.dart';
import 'package:moneymanager/db/function/catogory/catogory_db.dart';
import 'package:moneymanager/db/function/transaction/transaction_db.dart';
import 'package:moneymanager/screens/all_transaction/transaction.dart';
import 'package:moneymanager/screens/home_screen/single_card.dart';
import 'package:moneymanager/screens/home_screen/target_widget.dart';
import 'package:moneymanager/screens/home_screen/total_income_expense.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    CatogoryDb().refreshUi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TransactionDb().refreshUi();
    TextTheme _textTheme = Theme.of(context).textTheme;
    // Size size=MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TargetWidget(),
          const SizedBox(
            height: 10,
          ),
          const Text(
                'Balance',
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(175, 0, 0, 0),
                  fontWeight: FontWeight.w600,
                ),
              ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     const Text(
          //       'Balance',
          //       style: TextStyle(
          //         fontSize: 20,
          //         color: Color.fromARGB(175, 0, 0, 0),
          //         fontWeight: FontWeight.w600,
          //       ),
          //     ),
          //     // GestureDetector(
          //     //     onTap: () {
          //     //       setState(() {
          //     //         _search ? _search = false : _search = true;
          //     //       });
          //     //     },
          //     //     child: const Icon(
          //     //       Icons.search,
          //     //       size: 30,
          //     //     )),
          //   ],
          // ),
          // Visibility(visible: _search, child:  Search()),
          const SizedBox(
            height: 5,
          ),
          const TotalIncomeExpense(),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Recent Transaction',
                style: _textTheme.titleMedium
                    ?.copyWith(color: const  Color.fromARGB(201, 32, 30, 30)),
              ),
              // TextButton(
              //     onPressed: () {
              //       Navigator.of(context)
              //           .push(MaterialPageRoute(builder: (ctx) {
              //         return const AllTransactionScreen();
              //       }));
              //     },
              //     child: const Text('See All',style: TextStyle(
              //       fontWeight: FontWeight.bold,
              //       color: Color.fromRGBO(17, 34, 69, 1)
              //     ),))
            ],
          ),
          // const SizedBox(
          //   height: 5,
          // ),
          SingleCard(
            textTheme: Theme.of(context).textTheme,
          ),
        ],
      ),
    );
  }
}
