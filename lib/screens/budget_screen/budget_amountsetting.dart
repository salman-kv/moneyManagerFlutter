
import 'package:flutter/material.dart';
import 'package:moneymanager/db/function/catogory/catogory_db.dart';
import 'package:moneymanager/db/model/budget_model/budget_model.dart';

class BudgetAmountSetting extends StatelessWidget {
 final BudgetModel budgetModel;
   BudgetAmountSetting({required this.budgetModel,super.key});
TextEditingController budgetField=TextEditingController();
  @override
  Widget build(BuildContext context) {
    budgetModel.budget!=0 ? budgetField.text=budgetModel.budget.toString() : budgetField.text=''; 
    return SafeArea(child: Scaffold(
      appBar: AppBar(),
      body:Column(children: [
        Text(budgetModel.catogoryModel.name),
        TextField(
          controller: budgetField,
         ),
        ElevatedButton(onPressed: () async{
           Navigator.of(context).pop();
           budgetModel.budget=double.tryParse(budgetField.text)!; 
           budgetModel.selected=true;
           CatogoryDb().budgetSet(budgetModel);
        }, child: Icon(Icons.check)),
       
      ]),
    ));
  }
}