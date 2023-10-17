
import 'package:flutter/material.dart';
import 'package:moneymanager/db/function/catogory/catogory_db.dart';
import 'package:moneymanager/db/model/budget_model/budget_model.dart';
import 'package:moneymanager/screens/app_bar/all_appbar.dart';
import 'package:simple_chips_input/simple_chips_input.dart';

class BudgetAmountSetting extends StatelessWidget {
 final BudgetModel budgetModel;
   BudgetAmountSetting({required this.budgetModel,super.key});
TextEditingController budgetField=TextEditingController();
  @override
  Widget build(BuildContext context) {
    budgetModel.budget!=0 ? budgetField.text=budgetModel.budget.toString() : budgetField.text=''; 
    return SafeArea(child: Scaffold(
      appBar: AllAppbar(
        headname: 'Set Budget',
      ),
      body:Column(children: [
        Text(budgetModel.catogoryModel.name,style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold
        ),),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: budgetField,
            decoration: InputDecoration(
              labelText:'budget',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(100)
              )
            ),
           ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100)
            ),
            backgroundColor: Colors.black,
          ),
          onPressed: () async{
           Navigator.of(context).pop();
           budgetModel.budget=double.tryParse(budgetField.text)!; 
           budgetModel.selected=true;
           CatogoryDb().budgetSet(budgetModel);
        }, child: Icon(Icons.check)),
       
      ]),
    ));
  }
}