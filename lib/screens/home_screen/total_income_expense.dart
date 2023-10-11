import 'package:flutter/material.dart';
import 'package:moneymanager/db/function/transaction/transaction_db.dart';
import 'package:moneymanager/db/model/graph/graph_model.dart';
import 'package:moneymanager/theme/theme_constants.dart';

class TotalIncomeExpense extends StatelessWidget {
  const TotalIncomeExpense({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ValueListenableBuilder(valueListenable: TransactionDb().allTransactionListener, builder: (context, value, child) {
        List<GraphModel> ie=getGraphIEOnly();
        return    Row(
        children: [
          totalBox(context, incomeColor, ie[0].sum),
          const SizedBox(
            width: 10,
          ),
          totalBox(context, expenseColor, ie[1].sum),
        ],
      );
      },)
      
   
    );
  }
}

Widget totalBox(ctx, Color color, double amount) {
  TextTheme _textTheme = Theme.of(ctx).textTheme;
  return Expanded(
    child: Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
      ),
      child: Center(
          child: Text('₹$amount',
              style: _textTheme.titleLarge?.copyWith(
                color: Colors.white,
              ))),
    ),
  );
}
