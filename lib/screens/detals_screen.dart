import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../constans.dart';
import 'card_screen.dart';

class detalscreen extends StatefulWidget {
  final DocumentSnapshot snapshot ;

  detalscreen({required this.snapshot});

  @override
  State<detalscreen> createState() => _detalscreenState();
}

class _detalscreenState extends State<detalscreen> {
  final firestore = FirebaseFirestore.instance;

  int cont=0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size ;
    return Scaffold(
      appBar: AppBar(
        actions: [

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
        elevation: 0.0,
        backgroundColor:Color(int.parse(widget.snapshot['color']) ) ,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        },
            icon: SvgPicture.asset('assets/icons/back.svg',
              color: Colors.white,
            ),

        ),
      ),
      backgroundColor:  Color(int.parse(widget.snapshot['color']) ),
      body: SingleChildScrollView(

        child: Column(

          children: [

                SizedBox(height: size.height,
                  child: Stack(
                    children: [
                      Container(

                        margin: EdgeInsets.only(top: size.height*0.3),
                        padding: EdgeInsets.only(top: size.height*0.12,left: defoltpading,right: defoltpading),
                        decoration: BoxDecoration(
                          borderRadius:  BorderRadius.only(
                            topLeft: Radius.circular(24),
                            topRight:  Radius.circular(24),
                          ),
                          color: Colors.white
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('color',

                                    ),
                                    Row(
                                      children: [
                                        contcolor(color: Color(0xff356C95,
                                        ),
                                        ),
                                        contcolor(color: Color(0xffF8C078),
                                        ),
                                        contcolor(color: Color(0xffA29B9B),
                                        )
                                      ],
                                    ),


                                  ],
                                ),
                                SizedBox(width: 100),
                                Column(
                                  children: [
                                    Text('size',

                                    ),
                                    SizedBox(height: 5,),
                                    Text('${widget.snapshot['size']} ',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                             SizedBox(height: 30,),
                            Text('${widget.snapshot['description']}'),
                            SizedBox(height:30 ,),
                            Row(
                              children: [
                                 OutlinedButton(onPressed: (){
                                   setState(() {
                                     cont--;
                                   });
                                 },
                                     child: Icon(Icons.remove)),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                  child: Text('$cont',
                                    style: TextStyle(
                                      fontSize: 15
                                    ),
                                  ),
                                ),
                                OutlinedButton(onPressed: (){
                                           setState(() {
                                             cont++;
                                           });
                                },
                                    child: Icon(Icons.add)),
                                Spacer(),
                                Container(
                                  padding: EdgeInsets.all(8),
                                  child: SvgPicture.asset('assets/icons/heart.svg'),
                                  height: 32,
                                  width: 32,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFFF6464),
                                    shape: BoxShape.circle
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 80),
                            Row(
                              children: [
                                Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(18),
                                    border: Border.all(
                                      color:Color(int.parse(widget.snapshot['color']))
                                    )

                                  ),
                                  child: IconButton(onPressed: (){
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
                                        color: Color(int.parse(widget.snapshot['color'])),
                                      ),
                                  ),
                                ),
                                SizedBox(width: 15),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Color(int.parse(widget.snapshot['color'])),
                                    minimumSize: Size(240, 50),
                                    shape: RoundedRectangleBorder( //to set border radius to button
                                        borderRadius: BorderRadius.circular(20)
                                    ),

                                  ),
                                  onPressed: (){},
                                    child: Text('Buy Now',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold

                                      ),
                                    ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: defoltpading),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            Text('${widget.snapshot['type']} ',
                              style: TextStyle(
                                  color: Colors.white
                              ),
                            ),
                            Text('${widget.snapshot['title']}',
                              style: Theme.of(context).textTheme.headline4?.copyWith(
                                  color: Colors.white,
                                  fontWeight:FontWeight.bold

                              ),
                            ),
                            SizedBox(height: 5),
                            Row(
                              children: [
                                RichText(text: TextSpan(
                                    children: [
                                      TextSpan(text: 'price\n'),
                                      TextSpan(text: '\$${widget.snapshot['price']}',
                                          style: Theme.of(context).textTheme.headline4?.copyWith(
                                              color: Colors.white,
                                              fontWeight:FontWeight.bold
                                          )
                                      ),
                                    ]
                                ),
                                ),
                                SizedBox(width: defoltpading),
                            TweenAnimationBuilder(tween: Tween<double>(begin: 150,end: 200), duration: Duration(seconds: 2),
                                builder: (context,double value,child){
                              return     Expanded(child: Hero(
                                tag: '${widget.snapshot['image']}',
                                child: Image(
                                  image: AssetImage('${widget.snapshot['image']}',

                                  ),
                                  height: value,
                                  width: value,
                                ),
                              ),

                              );
                                })

                              ],
                            )
                          ],
                        ),
                      ),

                    ],
                  ),
                ),

          ],
        ),
      ),
    );
  }
}

class contcolor extends StatelessWidget {
  final Color color ;
  const contcolor({
    Key? key,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: defoltpading/4,right: defoltpading/2),
      padding: EdgeInsets.all(20),
      height: 24,
      width: 24,
      decoration: BoxDecoration(
        shape:BoxShape.circle ,

        color:  color
      ),
    );
  }
}
