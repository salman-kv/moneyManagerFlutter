import 'package:circular_progress_stack/circular_progress_stack.dart';
import 'package:flutter/material.dart';
import 'package:moneymanager/db/function/catogory/catogory_db.dart';
import 'package:moneymanager/db/function/transaction/transaction_db.dart';
import 'package:moneymanager/db/model/budget_model/budget_model.dart';
import 'package:moneymanager/db/model/catogory/catogory_model.dart';
import 'package:moneymanager/db/model/transaction/transaction_model.dart';
import 'package:moneymanager/screens/budget_screen/budget_add.dart';

class BudgetScreen extends StatelessWidget {
  const BudgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme _textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: ValueListenableBuilder(
          valueListenable: CatogoryDb().budgetValueNofifyListener,
          builder: (BuildContext, List<BudgetModel> newList, _) {
            return Column(
              children: [
                Expanded(
                  child: ListView(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(newList.length, (index)  {
                      return newList[index].budget != 0
                          ? FutureBuilder<double>(
                             future: CatogoryDb().budgetCalc(newList[index]),
                            builder:(context, snapshot) {
                              return  Column(
                                children: [
                                  Text(
                                    newList[index].catogoryModel.name,
                                    style: _textTheme.bodyLarge,
                                  ),
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child:
                                          SingleGradientStackCircularProgressBar(
                                        size: 200,
                                        progressStrokeWidth: 25,
                                        backStrokeWidth: 25,
                                        // startAngle: 0,
                                        // isTextShow: false,
                                        mergeMode: true,
                                        maxValue:  newList[index].budget ,
                                        backColor: const Color.fromARGB(
                                            255, 203, 184, 206),
                                        barColores: const [
                                          Color.fromARGB(255, 145, 25, 167),
                                          Colors.purple
                                        ],
                                        fullProgressColor: Colors.red,
                                        barValue: snapshot.data!,
                                      ),
                                    ),
                                  ),
                                  Text('${snapshot.data!} / ${newList[index].budget}')
                                ],
                              );
                              
                            },
                          )
                          : const SizedBox();
                    }),
                  ),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (ctx) {
                        return BudgetAdd();
                      }));
                    },
                    child: Text('click'))
              ],
            );
          }),
    );
  }
}
