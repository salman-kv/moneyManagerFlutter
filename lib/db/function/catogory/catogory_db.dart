// ignore: depend_on_referenced_packages
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:hive/hive.dart'; 
import 'package:moneymanager/db/model/catogory/catogory_model.dart';
import 'package:flutter/src/foundation/change_notifier.dart';

abstract class CatogoryDbFunction{
  Future<void> insertCatogory(CatogoryModel value);
  Future<List<CatogoryModel>> getCatogory();
  Future<void> delteCatogory(String id);
  Future<void> editCatogory(CatogoryModel val);
}

class CatogoryDb implements CatogoryDbFunction{


  CatogoryDb._internal();
  static  CatogoryDb CatogoryDb_internal=CatogoryDb._internal();
  factory CatogoryDb(){
    return CatogoryDb_internal;
  }


  ValueNotifier<List<CatogoryModel>> incomeCatogoryListtner=ValueNotifier([]);
  ValueNotifier<List<CatogoryModel>> expenseCatogoryListener=ValueNotifier([]);
  ValueNotifier<List<CatogoryModel>> toatalCatogoryListener=ValueNotifier([]);
  @override
  Future<void> insertCatogory(CatogoryModel value) async {
    final box=await Hive.openBox<CatogoryModel>('catogory');
    await box.put(value.id, value);
    refreshUi();
  }
  
  @override
  Future<List<CatogoryModel>> getCatogory() async{
    final box=await Hive.openBox<CatogoryModel>('catogory');
    return box.values.toList();
  }

  Future<void> refreshUi() async{
    final _catogoryDB= await getCatogory();
    incomeCatogoryListtner.value.clear();
    expenseCatogoryListener.value.clear();
    toatalCatogoryListener.value.clear();
    await Future.forEach(_catogoryDB, (element){
      toatalCatogoryListener.value.add(element);
      if(element.type==CatogoryType.income){
        incomeCatogoryListtner.value.add(element); 
      }
      else{
        expenseCatogoryListener.value.add(element);
      }
    });
    incomeCatogoryListtner.notifyListeners();
    expenseCatogoryListener.notifyListeners();
    toatalCatogoryListener.notifyListeners();
  }
  
  @override
  Future<void> delteCatogory(String id) async {
    
    final box=await Hive.openBox<CatogoryModel>('catogory');
    print(box.get(id));
   await box.delete(id);
    refreshUi();
  }
  

  @override
  Future<void> editCatogory(CatogoryModel val) async{
      final box=await Hive.openBox<CatogoryModel>('catogory');
      await box.put(val.id, val);
      refreshUi();
  }

//when search catogory

  Future<void> seearchRefresh(String name) async{
    final _catogoryDB= await getCatogory();
    incomeCatogoryListtner.value.clear();
    expenseCatogoryListener.value.clear();
    await Future.forEach(_catogoryDB, (element){
      print(element.name);
      if(element.type==CatogoryType.income && element.name.toLowerCase().contains(name.toLowerCase())){
        incomeCatogoryListtner.value.add(element); 
        print(incomeCatogoryListtner.value);
      }
      else if(element.type==CatogoryType.expense && element.name.contains(name)){
        expenseCatogoryListener.value.add(element);
      }
    });
    incomeCatogoryListtner.notifyListeners();
    expenseCatogoryListener.notifyListeners();
  }

}