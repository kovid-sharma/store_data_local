import 'package:flutter/material.dart';
import 'package:store_data_local/Model/User.dart';
import 'package:store_data_local/Pages/showdet.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_flutter/adapters.dart';
class filldetails extends StatefulWidget {
  final String Nameofuser;
  filldetails({required Key key, required this.Nameofuser}) : super(key: key);
  @override
  State<filldetails> createState() => _filldetailsState(Nameofuser);
}

class _filldetailsState extends State<filldetails> {
  String something;
  _filldetailsState(this.something);
  @override
  Widget build(BuildContext context) {
    Box? records = Hive.box("mibox");
    TextEditingController ageCnt=TextEditingController();
    TextEditingController genderCnt=TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text('Details Input for $something'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Text('Enter your age below:',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),

            ),
            SizedBox(
              height: 10,
            ),
            Container(

              height: 40,
              width: double.infinity,
              margin: EdgeInsets.all(40),
              child: TextFormField(
                controller: ageCnt,
                style: TextStyle(
                  fontSize: 40,
                ),
              ),
            ),
      SizedBox(
        height: 20,
      ),
      Text('Enter your gender below:',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,

        ),
      ),
            SizedBox(
              height: 10,
            ),
            Container(

              height: 40,
              width: double.infinity,
              margin: EdgeInsets.all(40),
              child: TextFormField(
                controller: genderCnt,

                style: TextStyle(
                  fontSize: 40,
                ),

              ),
            ),
            SizedBox(
              height: 40,
            ),
            Center(
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black),
                ),
                onPressed: ()async
                {
                  print(ageCnt.text);
                  String storage= something+'#'+ageCnt.text+'#'+genderCnt.text;
                  await records.put(something,storage);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => showdet(Nameofuser: something,key: Key('KOVID'),),
                      )
                  );
                },
                child: Text('Submit'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
