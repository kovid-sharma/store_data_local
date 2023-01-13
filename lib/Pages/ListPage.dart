import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:store_data_local/Pages/fillDetails.dart';
import 'package:store_data_local/Pages/showdet.dart';
import '../Model/User.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {

  Future<List<User>> readJsonData() async{
    final jsonData = await rootBundle.loadString("JsonFile/user.json");
    final list = json.decode(jsonData) as List<dynamic>;
    return list.map((e) => User.fromJson(e)).toList();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('KOVID SHARMA'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: FutureBuilder(
          future: readJsonData(),
          builder: (context,data){
            if(data.hasError) {
              return Text('${data.error}');
            }else if(data.hasData){
              var listOfData = data.data as List<User>;
              return ValueListenableBuilder(
                valueListenable: Hive.box('mibox').listenable(),
                builder: (context,box,child) {
                  return ListView.builder(
                    itemCount: listOfData.length,

                    itemBuilder: (context, index) {
                      final isSignIn= box.get(listOfData[index].title)=='KOVID';
                      return ListTile(

                        title: Text(listOfData[index].title.toString()),
                        leading: Text(listOfData[index].id.toString()),
                        subtitle: Text(listOfData[index].body.toString()),
                        trailing:
                        isSignIn?
                        ElevatedButton(//signout button
                          onPressed: () async {
                            await box.delete(listOfData[index].title);
                          },
                          child: Text(
                              'SignOUT'
                          ),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.green),
                          ),
                        ):
                        ElevatedButton(//signin button
                          onPressed: () async {
                            await box.put(listOfData[index].title, listOfData[index]);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => filldetails(Nameofuser: listOfData[index].title,key: Key('KOVID'),),
                                ));
                        },
                        child: Text(
                          'SignIn'
                        ),
                        ),
                        onTap: () async
                        {
                          if(isSignIn) //signout button but dont delete
                            {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => showdet(Nameofuser: listOfData[index].title,key: Key('Kovid'),),
                                  ));
                            }
                          else   //signin button put as well
                            {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => filldetails(Nameofuser: listOfData[index].title,key: Key('Kovid'),),
                                  ));
                              await box.put(listOfData[index].title, listOfData[index]);
                            }
                        },
                      );
                    }
                  );
                }
              );
            }else{
              return Text('Loading...');
            }
          },
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}