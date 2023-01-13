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
/*
I have added the working of app in the video above.
I have also added the direct drive link to download the .apk file for the app.

Now I will be explaining the project below:

First I had to read the json file which I did and also added the singleChildScrollview so that each user was visible.
For reading a json file , I made a custom class USER which consisted of 5 details like name,age,gender,id and account type of the each user.

Now for the main part of the assignment where we had to use hive for local storage,
I build two views, one where the user of the app enters his details and the other where the user can see the details of himself.

The key value for the hive box(named mibox) was the name of the user and the value contained a again a string which consisted of 3 informations(age,gender and name) (The information which was required by us to show at the showDetails View.



Now as shown in the video, The toggle of signIn to signOut wont change as hot reloads doesnot affects the local database and therfore for all hot reloads the information is retained in our app.

I have also attached the github project link of this below
 */