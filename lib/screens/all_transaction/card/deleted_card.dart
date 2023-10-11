import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:moneymanager/db/function/transaction/transaction_db.dart';
import 'package:moneymanager/db/model/catogory/catogory_model.dart';
import 'package:moneymanager/db/model/transaction/transaction_model.dart';
import 'package:moneymanager/screens/app_bar/all_appbar.dart';
import 'package:moneymanager/screens/catogory/catogory_income.dart';
import 'package:moneymanager/theme/theme_constants.dart';
import 'package:recase/recase.dart';

class DeletedCard extends StatelessWidget {
  final textTheme;

  const DeletedCard({required this.textTheme, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
 appBar: AllAppbar(headname: 'Deleted transaction'),
  body: Column(
        children: [
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: TransactionDb().deletedTransactionListener,
              builder: (BuildContext context, List<TransactionModel> newList, _) {
                return newList.isNotEmpty
                    ? ListView.builder(
                        itemBuilder: (ctx, index) {
                          return deletedCard(
                              context, newList.reversed.toList()[index]);
                        },
                        itemCount: newList.length,
                      )
                    : Center(
                        child: Text(
                        'no data found',
                        style: TextStyle(color: expenseColor),
                      ));
              },
            ),
          )
        ],
      ),
    );
  }

  Widget deletedCard(BuildContext context, TransactionModel transactionModel) {
    final _textTheme = textTheme;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onLongPress: () {
          longpressDelete(context, transactionModel);
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
                  color: const Color.fromARGB(50, 4, 45, 114),
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
                  Text(transactionModel.porpose.titleCase,
                      style: const TextStyle(
                          fontSize: 21, fontWeight: FontWeight.w500)),
                  Text(
                    transactionModel.catogoryModel.name.titleCase,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color:
                            transactionModel.catogoryType == CatogoryType.income
                                ? incomeColor
                                : expenseColor),
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
                  child: Text(
                    '${transactionModel.amount}',
                    style: TextStyle(
                        color:
                            transactionModel.catogoryType == CatogoryType.income
                                ? incomeColor
                                : expenseColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> longpressDelete(
    BuildContext context, TransactionModel transactionModel) {
  return showDialog(
      context: context,
      builder: ((context) {
        return AlertDialog(
          title: const Text(
            'Delete or Restore',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black),
          ),
          actions: [
            IconButton(
                onPressed: () async {
                  Navigator.of(context).pop();
                  await TransactionDb().restoreDeletedTransaction(transactionModel);
                },
                icon: const Icon(
                  Icons.restart_alt,
                )),
            IconButton(
                onPressed: () async {
                  Navigator.of(context).pop();
                  catogoryDeleteSnackBar(context, 'Transaction');
                  await TransactionDb().deleteTransactionFromDelete(transactionModel);
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                )),
          ],
        );
      }));
}
