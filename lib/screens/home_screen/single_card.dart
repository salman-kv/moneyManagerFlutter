import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:moneymanager/db/function/transaction/transaction_db.dart';
import 'package:moneymanager/db/model/catogory/catogory_model.dart';
import 'package:moneymanager/db/model/transaction/transaction_model.dart';
import 'package:moneymanager/screens/all_transaction/card/income_card.dart';
import 'package:moneymanager/theme/theme_constants.dart';

import 'package:recase/recase.dart';

class SingleCard extends StatefulWidget {
  final TextTheme textTheme;
  const SingleCard({required this.textTheme, super.key});

  @override
  State<SingleCard> createState() => _SingleCardState();
}

class _SingleCardState extends State<SingleCard> {
  @override
  Widget build(BuildContext context) {
    var m= MediaQuery.of(context).orientation;
    return ValueListenableBuilder(
      valueListenable: TransactionDb().allTransactionListener,
      builder: (BuildContext context, List<TransactionModel> newList, _) {
        return newList.isEmpty
            ? Center(
                child: Text(
                'no data',
                style: TextStyle(color: expenseColor),
              ))
            : GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                childAspectRatio: m == Orientation.portrait ? 1 / 1.1 : 1 / 1.5,
                crossAxisCount:  m == Orientation.portrait ? 2 : 4,
                // childAspectRatio:    1 / 1.1,
                // crossAxisCount: 2,
                children: List.generate(
                    newList.length > 10 ? 10 : newList.length, (index) {
                  return singleCard(newList.reversed.toList()[index]);
                }));
      },
    );
  }

  Widget singleCard(TransactionModel transactionModel) {
    TextTheme _textTheme = widget.textTheme;
    return GestureDetector(
      onLongPress: () {
        longpress(context, transactionModel);
      },
      child: Container(
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromARGB(255, 0, 0, 0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transactionModel.porpose.titleCase,
                  style: _textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      fontSize: 19),
                ),
                Text(
                  transactionModel.catogoryModel.name.titleCase,
                  style: _textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: const Color.fromARGB(255, 154, 154, 154)),
                ),
                Text(
                 ('₹${ transactionModel.amount.toString()}'),
                  style: _textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(214, 255, 255, 255)),
                ),
              ],
            ),
            Center(
                child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: transactionModel.catogoryType == CatogoryType.income
                    ? const Color.fromARGB(138, 200, 230, 201)
                    :transactionModel.catogoryType == CatogoryType.expense  ? const Color.fromARGB(49, 195, 103, 69) : Color.fromARGB(255, 1, 40, 54),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${transactionModel.dateTime.day}',
                    style: _textTheme.bodyLarge?.copyWith(
                        color: transactionModel.catogoryType ==
                                CatogoryType.expense
                            ? const Color.fromARGB(135, 255, 255, 255)
                            :transactionModel.catogoryType ==
                                CatogoryType.income ? Colors.black : const Color.fromARGB(255, 171, 169, 162) ) ,
                  ),
                  Text(
                    DateFormat.MMM().format(transactionModel.dateTime),
                    style: _textTheme.bodyLarge?.copyWith(
                        color:transactionModel.catogoryType ==
                                CatogoryType.expense
                            ? const Color.fromARGB(135, 255, 255, 255)
                            :transactionModel.catogoryType ==
                                CatogoryType.income ? Colors.black : const Color.fromARGB(255, 171, 169, 162)),
                  ),
                ],
              ),
            )),
            Center(
              child: transactionModel.catogoryType == CatogoryType.income
                  ? SizedBox(
                      width: 20,
                      height: 20,
                      child: Image.asset(
                        'icons/income.png',
                        color: incomeColor,
                      ),
                    )
                  : transactionModel.catogoryType == CatogoryType.expense ? SizedBox(
                      width: 20,
                      height: 20,
                      child: Image.asset(
                        'icons/expense.png',
                        color: expenseColor,
                      ),
                    ) : SizedBox(
                      width: 20,
                      height: 20,
                      child: Image.asset(
                        'icons/expense.png',
                        color: Color.fromARGB(255, 19, 96, 178),
                      ),
                    )
            ),
            SizedBox(
              width: double.infinity,
              child: transactionModel.catogoryType == CatogoryType.income
                  ? Text(
                      'Income',
                      textAlign: TextAlign.center,
                      style: _textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w500, color: incomeColor),
                    )
                  :transactionModel.catogoryType == CatogoryType.expense ? Text(
                      'Expense',
                      textAlign: TextAlign.center,
                      style: _textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w500, color: expenseColor),
                    ) : Text(
                      'Undifined',
                      textAlign: TextAlign.center,
                      style: _textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w500, color: const Color.fromARGB(255, 222, 222, 222)),
                    ) 
            ),
          ],
        ),
      ),
    );
  }
}
