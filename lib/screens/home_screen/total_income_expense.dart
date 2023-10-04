import 'package:flutter/material.dart';
import 'package:moneymanager/theme/theme_constants.dart';

class TotalIncomeExpense extends StatelessWidget {
  const TotalIncomeExpense({super.key});

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      child: SizedBox(
        width: double.infinity,
        child: Row(
          children: [
            totalBox(context, incomeColor,39000.62),
            const SizedBox(width: 10,),
            totalBox(context, expenseColor,6000.101),
          ],
        ),
      ),
    );
  }
}

Widget totalBox(ctx,Color color,double amount){
      TextTheme _textTheme=Theme.of(ctx).textTheme;
  return  Expanded(
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: color,
              ),
              child: Center(child: Text('₹$amount',style: _textTheme.titleLarge?.copyWith(
                color: Colors.white,
              ))),
            ),
          );
}
