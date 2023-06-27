import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_f/screens/login_screen.dart';

import '../main_catagory/women_catagory.dart';
import 'home_screen.dart';

class spalsh extends StatefulWidget {
  const spalsh({Key? key}) : super(key: key);

  @override
  State<spalsh> createState() => _spalshState();
}

class _spalshState extends State<spalsh> {
  navigat(){
    Navigator.push(context,
      MaterialPageRoute(builder: (context){
        return loginscreen();
      })
    );
  }
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), navigat);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent[100],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: AssetImage('assets/images/onlines-removebg-preview.png',

            ),
          ),


        ],
      ),
    );
  }
}
