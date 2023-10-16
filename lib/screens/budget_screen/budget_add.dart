import 'package:flutter/material.dart';
import 'package:moneymanager/db/function/catogory/catogory_db.dart';
import 'package:moneymanager/screens/budget_screen/budget_amountsetting.dart';

class BudgetAdd extends StatelessWidget {
  const BudgetAdd({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(),
      body: ValueListenableBuilder(
        valueListenable: CatogoryDb().budgetValueNofifyListener,
        builder: (context, value, child) {
          return Column(
            children: List.generate(value.length, (index) {
              return value[index].selected == true
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(value[index].catogoryModel.name),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(value[index].budget.toString()),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute(builder: (ctx) {
                                return BudgetAmountSetting(
                                  budgetModel: value[index],
                                );
                              }));
                            },
                            child: Icon(Icons.edit)),
                        ElevatedButton(
                            onPressed: () {
                              value[index].budget = 0;
                              value[index].selected = false;
                              CatogoryDb().budgetSet(value[index]);
                            },
                            child: Icon(Icons.clear))
                      ],
                    )
                  : const SizedBox();
            }),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        budgetAddBottomSheet(context);
      }),
    ));
  }

  Future<void> budgetAddBottomSheet(BuildContext context) async {
    showModalBottomSheet(
        context: context,
        builder: (ctx) {
          return ValueListenableBuilder(
            valueListenable: CatogoryDb().budgetValueNofifyListener,
            builder: (context, value, child) {
              return Column(
                children: List.generate(value.length, (index) {
                  return value[index].selected == false
                      ? Row(children: [
                          Text(value[index].catogoryModel.name),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(builder: (ctx) {
                                return BudgetAmountSetting(
                                  budgetModel: value[index],
                                );
                              }));
                            },
                            child: const Text('Add'),
                          ),
                        ])
                      : const SizedBox();
                }),
              );
            },
          );
        });
  }
}
