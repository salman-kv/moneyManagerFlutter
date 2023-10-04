import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:moneymanager/db/function/transaction/transaction_db.dart';
import 'package:moneymanager/db/model/transaction/transaction_model.dart';
import 'package:moneymanager/screens/all_transaction/edit_transaction.dart';
import 'package:moneymanager/screens/catogory/catogory_income.dart';
import 'package:moneymanager/theme/theme_constants.dart';
import 'package:recase/recase.dart';

class IncomeCard extends StatelessWidget {
  final textTheme;

  const IncomeCard({required this.textTheme, super.key});

  @override
  Widget build(BuildContext context) {
    // final _textTheme = textTheme;
    return Column(
      children: [
        // Search(),
        Expanded(
          child: ValueListenableBuilder(
            valueListenable: TransactionDb().incomeTransactionListener,
            builder: (BuildContext context, List<TransactionModel> newList, _) {
              return newList.isNotEmpty
                  ? ListView.builder(
                      itemBuilder: (ctx, index) {
                        return incomeCard(context, newList.reversed.toList()[index]);
                      },
                      itemCount: newList.length,
                    )
                  : Center(child: Text('no data found',style: TextStyle(
                    color: expenseColor
                  ),));
            },
          ),
        )
      ],
    );
  }

  Widget incomeCard(BuildContext context, TransactionModel transactionModel) {
    var _textTheme = textTheme;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onLongPress: () {
          longpress(context,transactionModel);
        },
        child: Container(
          height: 70,
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(255, 141, 141, 141),
                blurRadius: 4,
                offset: Offset(0, 1),
                blurStyle: BlurStyle.normal,
              )
            ],
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            color: containerColor,
          ),
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: const Color.fromARGB(138, 200, 230, 201),
                ),
                margin: const EdgeInsets.all(0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${transactionModel.dateTime.day}',
                      style: _textTheme.bodyLarge,
                    ),
                    Text(
                      DateFormat.MMM().format(transactionModel.dateTime),
                      style: _textTheme.bodyLarge,
                    )
                  ],
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(transactionModel.porpose.titleCase, style: _textTheme.titleLarge),
                  Text(
                    transactionModel.catogoryModel.name.titleCase,
                    style: TextStyle(fontSize: 16, color: incomeColor),
                  )
                ],
              ),
              const Spacer(),
              Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                    child: Text('${transactionModel.amount}',
                        style: TextStyle(
                      color: incomeColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                    ),
                       )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> longpress(BuildContext context,TransactionModel transactionModel) {
  print(transactionModel.catogoryModel.name);
  return showDialog(
      context: context,
      builder: ((context) {
        return AlertDialog(
          title:const Text(
            'Delete or Edit',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black),
          ),
          actions: [
            IconButton(
                onPressed: () async {
                  await Navigator.of(context)
                      .push(MaterialPageRoute(builder: (ctx) {
                    return  EditTransactionScreen(transactionModel: transactionModel,);
                  }));
                  // ignore: use_build_context_synchronously
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.edit,
                )),
            IconButton(
                onPressed: () async {
                  TransactionDb().deleteTransaction(transactionModel.id!);
                  Navigator.of(context).pop();
                  catogoryDeleteSnackBar(context, 'Transaction'); 
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                )),
          ],
        );
      }));
}
