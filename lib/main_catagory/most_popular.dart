import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_f/main_catagory/women_catagory.dart';

import '../constans.dart';
import '../screens/card_screen.dart';
import '../screens/detale_screen2.dart';
import '../screens/detals_screen.dart';
import '../screens/home_screen.dart';
import 'men_catagory.dart';

class mostpopular extends StatefulWidget {
  const mostpopular({Key? key}) : super(key: key);

  @override
  State<mostpopular> createState() => _mostpopularState();
}

class _mostpopularState extends State<mostpopular> {
  final firestore=FirebaseFirestore.instance ;
TextEditingController control = TextEditingController();
String inp ='';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    drawer: Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

         Center(child: Image(image: AssetImage('assets/images/shop_logo2-removebg-preview.png'))),
          GestureDetector(
            onTap: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context){
                    return homescreen() ;
                  }));
            },
            child: ListTile(
              leading: SvgPicture.asset('assets/images/womenl3.svg',
                height: 40,
              ),
              title: Text('women',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context){
                    return mencatagory() ;
                  }));
            },
            child: ListTile(
              leading: SvgPicture.asset('assets/images/menl.svg',
                height: 40,
              ),
              title: Text('men',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500
                ),
              ),
            ),
          )
        ],
      ),
    ),
      appBar: AppBar(
        title: SizedBox(
          height: 40,
          child: TextField(
            onChanged: (value){
              setState(() {
                inp=value;
              });
            },
    decoration: InputDecoration(
      suffixIcon: Icon(Icons.search_rounded),
    hintText: 'search',
    enabledBorder: OutlineInputBorder(
    borderSide: const BorderSide(width: 3, color: Colors.blue),
    borderRadius: BorderRadius.circular(15),
    ),
          ),
          ),
        ),
        backgroundColor: Colors.lightBlue[100],
          elevation: 0.0,
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
    ]
      ),
      body: ListView(
        children: [
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: defoltpading,vertical: 10),
            child: Text('most popular',
              style: Theme.of(context).textTheme.headline5?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: defoltpading),
            child: StreamBuilder<QuerySnapshot>(
              stream: firestore.collection('mostp').snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot){
                return snapshot.hasData?
                Container(
                  height: 300,
                  child: ListView.builder(

                      physics: ScrollPhysics(), // to disable GridView's scrolling

                      scrollDirection:Axis.horizontal ,
                      shrinkWrap: true,

                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (BuildContext context, int index) {
                        final  DocumentSnapshot documentsnapshot = snapshot.data!.docs[index] ;

                        return inp.isEmpty ?Padding(

                            padding: const EdgeInsets.symmetric(horizontal: defoltpading,vertical:defoltpading ),
                            child: Padding(

                                padding: const EdgeInsets.symmetric(horizontal: defoltpading,vertical:defoltpading ),
                                child: Container(
                                  height: 200,
                                  width: 160,
                                  decoration: BoxDecoration(

                                      color: Colors.lightBlue[100]

                                  ),
                                  child: Stack(
                                    alignment: Alignment.bottomCenter,
                                    children: [
                                      Positioned(

                                        child: GestureDetector(

                                          child: Hero(
                                            transitionOnUserGestures: true,
                                            tag: '${snapshot.data!.docs[index]['size']}',
                                            child: Image(image: AssetImage('${snapshot.data!.docs[index]['image']}'),

                                            ),
                                          ),
                                          onTap: (){
                                            Navigator.push(context, MaterialPageRoute(builder:
                                                (context){
                                              return detalescreent(snapshot: documentsnapshot,);
                                            }),
                                            );
                                          },
                                        ),
                                        height: 150,
                                        width: 150,
                                        top: 15,
                                      ),
                                      Positioned(
                                        left: 5,
                                        bottom: 5,
                                        child: Text(snapshot.data!.docs[index]['title'],
                                          style: TextStyle(
                                              color: Colors.black
                                          ),
                                        ),
                                      ),

                                      Positioned(
                                        right: 5,
                                        bottom: 5,
                                        child: Text('\$${snapshot.data!.docs[index]['price']}',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 5,
                                        top: 5,
                                        child: Text(snapshot.data!.docs[index]['type'],
                                          style: TextStyle(
                                              color: Colors.black
                                          ),
                                        ),
                                      ),
                                    ],

                                  ),
                                )
                            )
                        ):snapshot.data!.docs[index]['type'].toString().toLowerCase().replaceAll(' ', '').contains(inp.toLowerCase())?
                        Padding(

                            padding: const EdgeInsets.symmetric(horizontal: defoltpading,vertical:defoltpading ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal:defoltpading,vertical: defoltpading ),
                              child: Container(
                                height: 200,
                                width: 160,
                                decoration: BoxDecoration(

                                    color: Colors.lightBlue[100]

                                ),
                                child: Stack(
                                  alignment: Alignment.bottomCenter,
                                  children: [
                                    Positioned(

                                      child: GestureDetector(

                                        child: Hero(
                                          transitionOnUserGestures: true,
                                          tag: '${snapshot.data!.docs[index]['size']}',
                                          child: Image(image: AssetImage('${snapshot.data!.docs[index]['image']}'),

                                          ),
                                        ),
                                        onTap: (){
                                          Navigator.push(context, MaterialPageRoute(builder:
                                              (context){
                                            return detalescreent(snapshot: documentsnapshot,);
                                          }),
                                          );
                                        },
                                      ),
                                      height: 150,
                                      width: 150,
                                      top: 15,
                                    ),
                                    Positioned(
                                      left: 5,
                                      bottom: 5,
                                      child: Text(snapshot.data!.docs[index]['title'],
                                        style: TextStyle(
                                            color: Colors.black
                                        ),
                                      ),
                                    ),

                                    Positioned(
                                      right: 5,
                                      bottom: 5,
                                      child: Text('\$${snapshot.data!.docs[index]['price']}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 5,
                                      top: 5,
                                      child: Text(snapshot.data!.docs[index]['type'],
                                        style: TextStyle(
                                            color: Colors.black
                                        ),
                                      ),
                                    ),
                                  ],

                                ),
                              ),
                            )
                        ):Container();
                      }
                  ),
                ) :
                snapshot.hasError?Text('Eror'):Center(child: CircularProgressIndicator())  ;
              },

            ),
          ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Divider(
                  height: 2,
                  color: Colors.black,
                  thickness: 1,
                ),
              ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defoltpading),
            child: StreamBuilder<QuerySnapshot>(
              stream: firestore.collection('mostp').snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot){
                return snapshot.hasData?
                GridView.builder(

                    physics: ScrollPhysics(), // to disable GridView's scrolling

                    scrollDirection:Axis.vertical ,
                    shrinkWrap: true,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.80

                    ),
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (BuildContext context, int index) {
                      final  DocumentSnapshot documentsnapshot = snapshot.data!.docs[index] ;

                      return Padding(

                          padding: const EdgeInsets.symmetric(horizontal: defoltpading,vertical:defoltpading ),
                          child: Container(
                            height: 200,
                            width: 160,
                            decoration: BoxDecoration(

                                color: Colors.lightBlue[100]

                            ),
                            child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                Positioned(

                                  child: GestureDetector(

                                    child: Hero(
                                      transitionOnUserGestures: true,
                                      tag: '${snapshot.data!.docs[index]['image']}',
                                      child: Image(image: AssetImage('${snapshot.data!.docs[index]['image']}'),

                                      ),
                                    ),
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder:
                                          (context){
                                        return detalescreent(snapshot: documentsnapshot,);
                                      }),
                                      );
                                    },
                                  ),
                                 height: 150,
                                  width: 150,
                                  top: 15,
                                ),
                                Positioned(
                                  left: 5,
                                  bottom: 5,
                                  child: Text(snapshot.data!.docs[index]['title'],
                                    style: TextStyle(
                                        color: Colors.black
                                    ),
                                  ),
                                ),

                                Positioned(
                                  right: 5,
                                  bottom: 5,
                                  child: Text('\$${snapshot.data!.docs[index]['price']}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 5,
                                  top: 5,
                                  child: Text(snapshot.data!.docs[index]['type'],
                                    style: TextStyle(
                                        color: Colors.black
                                    ),
                                  ),
                                ),
                              ],

                            ),
                          )
                      );
                    }
                ) :
                snapshot.hasError?Text('Eror'):Center(child: CircularProgressIndicator())  ;
              },

            ),
          )

        ],
      ),
    );
  }
}
