import 'package:hive_flutter/adapters.dart';
import 'package:moneymanager/db/model/catogory/catogory_model.dart';
part 'transaction_model.g.dart';


@HiveType(typeId: 3)
class TransactionModel {
  @HiveField(0)
  final String porpose;

  @HiveField(1)
  final double amount;

  @HiveField(2)
  final DateTime dateTime;

  @HiveField(3)
  final CatogoryType catogoryType;

  @HiveField(4)
  final CatogoryModel catogoryModel;

  @HiveField(5)
  String? id;

  TransactionModel(
      {required this.porpose,
      required this.amount,
      required this.dateTime,
      required this.catogoryType,
      required this.catogoryModel,
      required this.id
      });
}
