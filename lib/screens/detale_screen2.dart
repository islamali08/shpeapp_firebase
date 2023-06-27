import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../constans.dart';
import 'card_screen.dart';

class detalescreent extends StatefulWidget {
   final DocumentSnapshot snapshot ;

   detalescreent({required this.snapshot});

  @override
  State<detalescreent> createState() => _detalescreentState();
}

class _detalescreentState extends State<detalescreent> {
  final firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        backgroundColor: Color(int.parse(widget.snapshot['color']) ) ,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40,horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(onPressed: (){
                  Navigator.pop(context);
                },
                  icon: SvgPicture.asset('assets/icons/back.svg',
                    color: Colors.white,
                  ),

                ),

                Column(
                  children: [
                    Text(widget.snapshot['title'],
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black26
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(widget.snapshot['type'],
                      style: TextStyle(
                          fontSize: 17,

                      ),
                    )
                  ],
                ),
                IconButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return cardscreen();
                  }),
                  );
                },

                  icon: SvgPicture.asset('assets/icons/cart.svg',
                    color: Colors.white,
                  ),

                ),
              ],
            ),
            TweenAnimationBuilder(tween: Tween<double>(begin: 90,end: 150), duration: Duration(seconds: 1),
                builder: (context,double value,child){
                  return     Hero(
                    tag: '${widget.snapshot['size']}',
                    child: Image(
                      image: AssetImage('${widget.snapshot['image']}',

                      ),
                      height: value,
                      width: value,
                    ),
                  );
                }),



            Text(widget.snapshot['description'],
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500
              ),
            ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('color',
                          style: TextStyle(
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(height:  5,),
                        Row(
                          children: [
                            Container(
                              height: 24,
                              width: 24,
                              decoration: BoxDecoration(
                                  shape:BoxShape.circle,
                                  color: Colors.blue
                              ),
                            ),
                            SizedBox(width: 5),
                            Container(
                              height: 24,
                              width: 24,
                              decoration: BoxDecoration(
                                  shape:BoxShape.circle,
                                  color: Colors.red
                              ),
                            ),
                            SizedBox(width: 5),

                            Container(
                              height: 24,
                              width: 24,
                              decoration: BoxDecoration(
                                  shape:BoxShape.circle,
                                  color: Colors.deepPurple
                              ),
                            ),



                          ],
                        ),

                      ],
                    ),
                    SizedBox(width: 220,),
                    Column(
                      children: [
                        Text('size',
                          style: TextStyle(
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(height:  5,),
                        Text('${widget.snapshot['size']}')
                      ],
                    )
                  ],
                ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('add to card',
                      style: TextStyle(
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height:  5,),
                    IconButton(onPressed: (){
                      setState(() {
                        firestore.collection('final_favorit').add({
                          'image':widget.snapshot['image'],
                          'color':widget.snapshot['color'],
                          'title':widget.snapshot['title'],
                          'price':widget.snapshot['price']
                        });
                      });
                      Fluttertoast.showToast(msg: 'added to cart',
                        fontSize: 12,
                        backgroundColor: Colors.lightBlue,
                        gravity: ToastGravity.CENTER,
                        textColor: Colors.black,
                        timeInSecForIosWeb: 2,

                      );
                    },
                      icon: SvgPicture.asset('assets/icons/cart.svg',

                      ),
                    ),

                  ],
                ),
                Spacer(),
                Column(
                  children: [
                    Text('price',
                      style: TextStyle(
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height:  10,),
                    Text('\$${widget.snapshot['price']}',
                      style: TextStyle(
                        fontSize: 20
                      ),
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
