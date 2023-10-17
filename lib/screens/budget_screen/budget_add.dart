import 'package:flutter/material.dart';
import 'package:moneymanager/db/function/catogory/catogory_db.dart';
import 'package:moneymanager/screens/app_bar/all_appbar.dart';
import 'package:moneymanager/screens/budget_screen/budget_amountsetting.dart';
import 'package:moneymanager/theme/theme_constants.dart';

class BudgetAdd extends StatelessWidget {
  const BudgetAdd({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AllAppbar(headname: 'Budget'),
      body: ValueListenableBuilder(
        valueListenable: CatogoryDb().budgetValueNofifyListener,
        builder: (context, value, child) {
          var bu = false;
          value.forEach((element) {
            if (element.selected != false) {
              bu = true;
            }
          });

          return bu
              ? Column(
                  children: List.generate(value.length, (index) {
                    return value[index].selected == true
                        ? Container(
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 8, 8, 8),
                                borderRadius: BorderRadius.circular(100)),
                            padding: EdgeInsets.all(8),
                            margin: EdgeInsets.all(8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  child: Text(
                                    value[index].catogoryModel.name,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                    child: Text(
                                  value[index].budget.toString(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                )),
                                IconButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(builder: (ctx) {
                                        return BudgetAmountSetting(
                                          budgetModel: value[index],
                                        );
                                      }));
                                    },
                                    icon: Icon(
                                      Icons.edit,
                                      color: Colors.white,
                                    )),
                                IconButton(
                                    onPressed: () {
                                      value[index].budget = 0;
                                      value[index].selected = false;
                                      CatogoryDb().budgetSet(value[index]);
                                    },
                                    icon: Icon(
                                      Icons.clear,
                                      color: Colors.white,
                                    ))
                              ],
                            ),
                          )
                        : const SizedBox();
                  }),
                )
              : Center(
                  child: Text(
                    'Pls add your Budget',
                    style: TextStyle(color: expenseColor),
                  ),
                );
        },
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          child: const Icon(Icons.add),
          onPressed: () {
            budgetAddBottomSheet(context);
          }),
    ));
  }

  Future<void> budgetAddBottomSheet(BuildContext context) async {
    Size size = MediaQuery.of(context).size;
    showModalBottomSheet(
        context: context,
        builder: (ctx) {
          return Container(
            constraints: BoxConstraints(minHeight: size.height * 0.3),
            child: ValueListenableBuilder(
              valueListenable: CatogoryDb().budgetValueNofifyListener,
              builder: (context, value, child) {
                var bu = false;
                value.forEach((element) {
                  if (element.selected != true) {
                    bu = true;
                  }
                });
                return bu
                    ? SingleChildScrollView(
                        child: Column(
                          children: List.generate(value.length, (index) {
                            return value[index].selected == false
                                ? Container(
                                    decoration: BoxDecoration(
                                        color:
                                            const Color.fromARGB(255, 0, 0, 0),
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    padding: const EdgeInsets.all(8),
                                    margin: const EdgeInsets.all(8),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                      Text(
                                        value[index].catogoryModel.name,
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            Navigator.of(context)
                                                .pushReplacement(
                                                    MaterialPageRoute(
                                                        builder: (ctx) {
                                              return BudgetAmountSetting(
                                                budgetModel: value[index],
                                              );
                                            }));
                                          },
                                          // icon: const Text('Add',style: TextStyle(color: Colors.amber),),
                                          icon: Container(
                                            decoration: BoxDecoration(
                                                color: const Color.fromARGB(
                                                    255, 255, 255, 255),
                                                borderRadius:
                                                    BorderRadius.circular(100)),
                                            child:const Icon(Icons.add),
                                          )),
                                    ]),
                                  )
                                : const SizedBox();
                          }),
                        ),
                      )
                    : Center(
                        child: Text(
                          'No expence catogory found',
                          style: TextStyle(color: expenseColor),
                        ),
                      );
              },
            ),
          );
        });
  }
}
