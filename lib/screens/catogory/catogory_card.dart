import 'package:flutter/material.dart';
import 'package:moneymanager/db/function/catogory/catogory_db.dart';
import 'package:moneymanager/db/model/catogory/catogory_model.dart';
import 'package:moneymanager/screens/catogory/catogory_income.dart';
import 'package:moneymanager/screens/catogory/edit_catogory.dart';
import 'package:moneymanager/theme/theme_constants.dart';
import 'package:recase/recase.dart';

class CatogoryCard extends StatelessWidget {
  final TextTheme textTheme;
  final CatogoryModel singleList;
  const CatogoryCard({required this.textTheme,required this.singleList, super.key});

  @override
  Widget build(BuildContext context) { 
    var _textTheme = textTheme;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(7),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          color: containerColor,
        ),
        height: 70,
        child: Row(
          children: [
            Text(singleList.name.titleCase, style: _textTheme.titleLarge?.copyWith(
              color: singleList.type==CatogoryType.income ? incomeColor : expenseColor,
              fontWeight: FontWeight.w600
            )),
            const Spacer(),
            IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (ctx){
                  return EditCatogory(catogoryModel: singleList);
                }));
              },
              icon: const Icon(Icons.edit),
            ),
            IconButton(
              onPressed: () {
                deleteAlartSnackbar(context, 'delete',singleList);
              },
              icon: const Icon(Icons.delete),
            )
          ],
        ),
      ),
    );
  }
  Future<void> deleteAlartSnackbar(BuildContext context, String name,CatogoryModel catogoryModel) {
  return showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: Text('do you want to $name'),
          actions:  [
            IconButton(onPressed: (){
              Navigator.of(context).pop();
            }, icon: const Icon(
              Icons.close,
              color: Colors.red,
            ),),
            IconButton(onPressed: (){
              CatogoryDb().delteCatogory(catogoryModel.id);
              Navigator.of(context).pop();
              catogoryDeleteSnackBar(context,'Catogory');
            }, icon:const Icon(
              Icons.check,
              color: Colors.green,
            )),
            
           
          ],
        );
      });
}
}
