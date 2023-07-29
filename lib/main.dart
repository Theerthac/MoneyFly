import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:project/Screens/Chart.dart';
import 'package:project/model/add_data.dart';
import 'Screens/Bottom.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(adddataAdapter());
  await Hive.openBox<add_data>('data');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Bottom());
  }
}
