import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constans.dart';
import 'detals_screen.dart';

class cardscreen extends StatefulWidget {
  @override
  State<cardscreen> createState() => _cardscreenState();
}

class _cardscreenState extends State<cardscreen> {
  final firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: SvgPicture.asset('assets/icons/back.svg'),
        ),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: defoltpading),
        child: ListView(
          physics: ScrollPhysics(), // to disable GridView's scrolling

          children: [
            Text('Card',
              style: Theme.of(context).textTheme.headline4?.copyWith(
                  color: Colors.black,
                  fontWeight:FontWeight.bold

              ),
            ),
                 StreamBuilder<QuerySnapshot>(
                   stream: firestore.collection('final_favorit').snapshots(),
                     builder: (context,snapshot){
                     return snapshot.hasData?
                     ListView.builder(
                         physics: ScrollPhysics(), // to disable GridView's scrolling

                         scrollDirection: Axis.vertical,
                         shrinkWrap: true,
                       itemCount: snapshot.data!.docs.length,
                         itemBuilder: (context,index){

                           return Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Container(
                             color:  Color(int.parse(snapshot.data!.docs[index]['color'])),
                             child: Row(
                               children: [
                                 Image(

                                   image: AssetImage('${snapshot.data!.docs[index]['image']}',

                                   ),
                                   height: 100,
                                   width: 100,
                                 ),
                                 SizedBox(width: 50),
                                 Column(
                                   children: [
                                     Text('${snapshot.data!.docs[index]['title']}',
                                       style: TextStyle(
                                         fontWeight: FontWeight.bold
                                       ),
                                     ),
                                     SizedBox(height: 5,),
                                     Text('price',
                                       style: TextStyle(
                                         fontSize: 15
                                       ),
                                     ),
                                     SizedBox(height: 5,),

                                     Text('\$${snapshot.data!.docs[index]['price']}',
                                       style: TextStyle(
                                         fontSize: 20
                                       ),
                                     ),


                                   ],
                                 ),
                                   Spacer(),
                                   IconButton(onPressed: (){
                                     setState(() {
                                       firestore.collection('final_favorit').doc(snapshot.data!.docs[index].id).delete();

                                     });
                                   }, icon: Icon(Icons.delete))
                               ],
                             ),
                           ),
                         );

                         }
                     )
                         :snapshot.hasError?
                     Text('eror')
                         :CircularProgressIndicator.adaptive() ;
                     }
                 )
          ],
        ),
      ),
    );
  }
}
