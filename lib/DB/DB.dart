import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:project/model/add_data.dart';


ValueNotifier<List<add_data>> addListNotifier = ValueNotifier([]);

Future<void> addMoney(add_data value) async {
  final adddDB = await Hive.openBox<add_data>("data");
  final _id = await adddDB.add(value);
  value.id = _id;

  await adddDB.add(value);
  addListNotifier.value.add(value);
  addListNotifier.notifyListeners();
}

Future<void> getAlldata() async {
  final adddDB = await Hive.openBox<add_data>("data");
  addListNotifier.value.clear();
  addListNotifier.value.addAll(adddDB.values);
  addListNotifier.notifyListeners();
}

Future<void> deletedata(index) async {
  final adddDB = await Hive.openBox<add_data>("data");
  await adddDB.deleteAt(index);
  getAlldata();
}

Future<void> editdata(index, add_data value) async {
  final adddDB = await Hive.openBox<add_data>('data');
  addListNotifier.value.clear();
  addListNotifier.value.addAll(adddDB.values);
  addListNotifier.notifyListeners();

  adddDB.putAt(index, value);
  getAlldata();
}
