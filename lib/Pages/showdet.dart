

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import '../Model/User.dart';
class showdet extends StatefulWidget {
  final String Nameofuser;
  showdet({required Key key, required this.Nameofuser}) : super(key: key);

  @override
  State<showdet> createState() => _showdetState(Nameofuser);
}

class _showdetState extends State<showdet> {
  String something;
  _showdetState(this.something);

  @override
  Widget build(BuildContext context) {
    Box records = Hive.box("mibox");
    String xx= records.get(something);
    int i=0;
    while(i<xx.length && xx[i]!='#')
      {
        i++;
      }

      i++;
    String ageF='';
    while(i<xx.length && xx[i]!='#')
    {
      ageF+=xx[i];
      i++;
    }
    i++;
    String genderF='';
    while(i<xx.length)
    {
      genderF+=xx[i];
      i++;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('KOVID SHARMA Details show'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('The Name is $something',
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),

          ),
          SizedBox(
            height: 40,
          ),
          Text("The age is: $ageF" ,
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Text("The gender is: $genderF",
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Center(
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green),
              ),
              onPressed: ()
              {
                Navigator.pushNamed(context, 'home');
              },
              child: Text('Go to Home')

              ),
            ),
        ],
      ),
    );
  }
}
