import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constans.dart';
import '../main_catagory/women_catagory.dart';
import 'card_screen.dart';

class homescreen extends StatefulWidget {
  const homescreen({Key? key}) : super(key: key);

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(

          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(onPressed: (){
                    Navigator.pop(context);
          },

              icon: SvgPicture.asset('assets/icons/back.svg'),

          ),
          actions: [

            IconButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return cardscreen();
                    }),
                    );
            },

              icon: SvgPicture.asset('assets/icons/cart.svg',
                color: ktextcolor,
              ),

            ),
          ],
        ),
        body: womencatagory(),
      ),
    );
  }
}
