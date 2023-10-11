import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:moneymanager/db/function/transaction/transaction_db.dart';
import 'package:moneymanager/db/model/catogory/catogory_model.dart';
import 'package:moneymanager/db/model/transaction/transaction_model.dart';

abstract class CatogoryDbFunction {
  Future<void> insertCatogory(CatogoryModel value);
  Future<List<CatogoryModel>> getCatogory();
  // Future<void> delteCatogory(String id);
  // Future<void> editCatogory(CatogoryModel val);
}

class CatogoryDb implements CatogoryDbFunction {
  CatogoryDb._internal();
  static CatogoryDb catogoryDbInternal = CatogoryDb._internal();
  factory CatogoryDb() {
    return catogoryDbInternal;
  }

  ValueNotifier<List<CatogoryModel>> incomeCatogoryListtner = ValueNotifier([]);
  ValueNotifier<List<CatogoryModel>> expenseCatogoryListener =
      ValueNotifier([]);
  ValueNotifier<List<CatogoryModel>> toatalCatogoryListener = ValueNotifier([]);
  @override
  Future<void> insertCatogory(CatogoryModel value) async {
    final box = await Hive.openBox<CatogoryModel>('catogory');
    await box.put(value.id, value);
    refreshUi();
  }

  Future<void> undifinedInitial() async {
    final box = await Hive.openBox<CatogoryModel>('catogory');
    if (box.values.isEmpty) {
      box.add(CatogoryModel(
          id: 'undifined',
          name: 'undifined',
          type: CatogoryType.undifined,
          isDeleted: false));
    }
  }

  @override
  Future<List<CatogoryModel>> getCatogory() async {
    final box = await Hive.openBox<CatogoryModel>('catogory');
    return box.values.toList();
  }

  Future<void> refreshUi() async {
    // var box = await Hive.openBox<CatogoryModel>('catogory');
    // for (var element in box.values) {
    //   print(' -- -- -- ${element.name} --- ${element.id}');
    // }
    final catogoryDB = await getCatogory();
    incomeCatogoryListtner.value.clear();
    expenseCatogoryListener.value.clear();
    toatalCatogoryListener.value.clear();

    await Future.forEach(catogoryDB, (element) {
      toatalCatogoryListener.value.add(element);
      print(element.name);
      if (element.type == CatogoryType.income) {
        incomeCatogoryListtner.value.add(element);
      } else if (element.type == CatogoryType.expense) {
        expenseCatogoryListener.value.add(element);
      }
    });
    incomeCatogoryListtner.notifyListeners();
    expenseCatogoryListener.notifyListeners();
    toatalCatogoryListener.notifyListeners();
  }

  Future<void> delteCatogory(CatogoryModel catogoryModel) async {
    final box = await Hive.openBox<CatogoryModel>('catogory');

    await box.delete(catogoryModel.id);
    final tBox = await Hive.openBox<TransactionModel>(TRANSACTION_DB_NAME);

    await Future.forEach(tBox.values, (element) {
      if (element.catogoryModel.name == catogoryModel.name) {
        element.catogoryType = CatogoryType.undifined;
        element.catogoryModel.name = 'undifined';
        element.catogoryModel.type = CatogoryType.undifined;
        element.catogoryModel.id = 'undifined';
        tBox.put(element.id, element);
      }
    });

    refreshUi();
  }

  Future<void> editCatogory(CatogoryModel val) async {
    final box = await Hive.openBox<CatogoryModel>('catogory');
    final tBox = await Hive.openBox<TransactionModel>(TRANSACTION_DB_NAME);
    await Future.forEach(tBox.values, (element) {
      if (element.catogoryModel.id == val.id) {
        element.catogoryModel.name = val.name;
        tBox.put(element.id, element);
      }
    });
    await box.put(val.id, val);
    refreshUi();
  }

//when search catogory

  Future<void> seearchRefresh(String name) async {
    final catogoryDB = await getCatogory();
    incomeCatogoryListtner.value.clear();
    expenseCatogoryListener.value.clear();
    await Future.forEach(catogoryDB, (element) {
      if (element.type == CatogoryType.income &&
          element.name.toLowerCase().contains(name.toLowerCase())) {
        incomeCatogoryListtner.value.add(element);
      } else if (element.type == CatogoryType.expense &&
          element.name.contains(name)) {
        expenseCatogoryListener.value.add(element);
      }
    });
    incomeCatogoryListtner.notifyListeners();
    expenseCatogoryListener.notifyListeners();
  }

  Future<void> changeCatogoryOnDelete(String id) async {}
}
