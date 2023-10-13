import 'package:hive_flutter/adapters.dart';
import 'package:moneymanager/db/function/catogory/catogory_db.dart';
import 'package:moneymanager/db/function/transaction/transaction_db.dart';
import 'package:moneymanager/db/model/catogory/catogory_model.dart';
import 'package:moneymanager/db/model/target/target_model.dart';
import 'package:moneymanager/db/model/transaction/transaction_model.dart';
import 'package:moneymanager/screens/home_screen/add_target.dart';

Future<void> clearAll() async {
  var catogoryBox = await Hive.openBox<CatogoryModel>('catogory');
  await catogoryBox.clear();
  CatogoryDb().refreshUi();
  var transactionBox =
      await Hive.openBox<TransactionModel>(TRANSACTION_DB_NAME);
  await transactionBox.clear();
TransactionDb().refreshUi();
  var targetBox = await Hive.openBox<TargetModelOfMoney>('Target-Db');
  await targetBox.clear();

  var deletedBox = await Hive.openBox<TransactionModel>(deletedDbName);
  await deletedBox.clear();
  TransactionDb().deleteRefresh();


  targetModelListener.value = TargetModelOfMoney(
      target: 'Add Target', startTime: DateTime.now(), endTime: DateTime.now());


}
