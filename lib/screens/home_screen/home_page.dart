import 'package:flutter/material.dart';
import 'package:moneymanager/db/function/catogory/catogory_db.dart';
import 'package:moneymanager/db/function/transaction/transaction_db.dart';
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
    CatogoryDb().undifinedInitial();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TransactionDb().refreshUi();
    TextTheme _textTheme = Theme.of(context).textTheme;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TargetWidget(),
          const SizedBox(
            height: 10,
          ),
         const  Padding(
            padding:  EdgeInsets.all(8.0),
            child:  Text(
                  'Balance',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(175, 0, 0, 0),
                    fontWeight: FontWeight.w600,
                  ),
                ),
          ),
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Recent Transaction',
                  style: _textTheme.titleMedium
                      ?.copyWith(color: const  Color.fromARGB(201, 32, 30, 30)),
                ),
              ),
            ],
          ),
          SingleCard(
            textTheme: Theme.of(context).textTheme,
          ),
        ],
      ),
    );
  }
}
