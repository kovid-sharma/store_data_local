import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:store_data_local/Pages/ListPage.dart';
import 'package:store_data_local/Pages/fillDetails.dart';
import 'package:store_data_local/Pages/showdet.dart';
import 'package:hive_flutter/hive_flutter.dart';
Future<void> main() async{
  await Hive.initFlutter();
  await Hive.openBox('mibox');
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kovid Sharma',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes:
      {
        'show':(context)=>showdet(Nameofuser: 'Kovid',key: Key('KOVID'),),
        'fill':(context)=>filldetails(Nameofuser: 'Kovid',key: Key('KOVID'),),
        'home':(context)=>ListPage(),
      },
      home: const ListPage(),
    );
  }
}