
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constans.dart';
import '../screens/detale_screen2.dart';
import '../screens/detals_screen.dart';

class womencatagory extends StatefulWidget {
  const womencatagory({Key? key}) : super(key: key);

  @override
  State<womencatagory> createState() => _womencatagoryState();
}

class _womencatagoryState extends State<womencatagory> {
  final firestore=FirebaseFirestore.instance ;
  int selectindex =0;
  void ontap(int index){
    setState(() {
      selectindex=index;
    });
  }
  @override
  Widget build(BuildContext context) {
    List <Widget> showwidg= [
      ListView(
        children: [
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: defoltpading,vertical: 10),
            child: Text('women',
              style: Theme.of(context).textTheme.headline5?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),


          StreamBuilder<QuerySnapshot>(
            stream: firestore.collection('womenp').snapshots(),
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
                              )
                            ],

                          ),
                        )
                    );
                  }
              ) :
              snapshot.hasError?Text('Eror'):Center(child: CircularProgressIndicator())  ;
            },

          )

        ],
      ),
      ListView(
        children: [
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: defoltpading,vertical: 10),
            child: Text('women',
              style: Theme.of(context).textTheme.headline5?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),


          Padding(
            padding: const EdgeInsets.symmetric(vertical: defoltpading),
            child: StreamBuilder<QuerySnapshot>(
              stream: firestore.collection('womenj').snapshots(),
              builder: (context,snapshot){

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
                                )
                              ],

                            ),
                          )
                      );
                    }
                ) :
                snapshot.hasError?
                Text('Eror'):
                CircularProgressIndicator()  ;
              },

            ),
          )

        ],
      ),
      ListView(
        children: [
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: defoltpading,vertical: 10),
            child: Text('women',
              style: Theme.of(context).textTheme.headline5?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),


          Padding(
            padding: const EdgeInsets.symmetric(vertical: defoltpading),
            child: StreamBuilder<QuerySnapshot>(
              stream: firestore.collection('womend').snapshots(),
              builder: (context,snapshot){
                return snapshot.hasData?  GridView.builder(
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
                                )
                              ],

                            ),
                          )
                      );
                    }
                ) :snapshot.hasError?Text('Eror'):CircularProgressIndicator()  ;
              },

            ),
          )

        ],
      ),
    ];
    return Scaffold(
      body: showwidg.elementAt(selectindex),

    bottomNavigationBar: BottomNavigationBar(
    items:  [
    BottomNavigationBarItem(
      backgroundColor: Colors.green,
    icon: Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(
          border: Border.all(
            color: selectindex==0?Colors.red:Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(5)
      ),
      child: SvgPicture.asset('assets/icons/imag3.svg',
        height: 40,
        width: 40,
        color: Colors.black54,

      ),
    ),
    label: 'Bags',
    ),
    BottomNavigationBarItem(
      backgroundColor: Colors.deepPurple,
    icon:  Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(
        border: Border.all(
          color: selectindex==1?Colors.red:Colors.transparent,
        ),
         borderRadius: BorderRadius.circular(5)
      ),
      child: SvgPicture.asset('assets/icons/jewelry-logo.svg',
      height: 40,
      width: 40,
        color: Colors.black54,
        allowDrawingOutsideViewBox: true,
        fit: BoxFit.contain,

      ),
    ),
    label: 'jelelry',
    ),
    BottomNavigationBarItem(
    icon:  Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(
          border: Border.all(
            color: selectindex==2?Colors.red:Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(5)
      ),
      child: SvgPicture.asset('assets/icons/dress2.svg',
        height: 40,
        width: 40,
        color: Colors.black54,
      ),
    ),
    label: 'Dress',
      backgroundColor: Colors.deepPurple
    ),
    ],
    currentIndex: selectindex,
    selectedItemColor: Colors.teal,
    backgroundColor: Colors.lightBlueAccent[100],
    unselectedItemColor: Colors.transparent,
    selectedFontSize: 12,
    selectedIconTheme:IconThemeData(
        color: Colors.red
    ) ,
    onTap: ontap,
    )
    );
  }
}
