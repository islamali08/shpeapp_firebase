import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../constans.dart';

class forgetpass extends StatefulWidget {
  const forgetpass({Key? key}) : super(key: key);

  @override
  State<forgetpass> createState() => _forgetpassState();
}

class _forgetpassState extends State<forgetpass> {
  var formKey = GlobalKey<FormState>();
 bool isvald =false ;
  String? validatemail (String? value){
    if(value!.isEmpty){
      return 'requid' ;
    }else if(  EmailValidator(

      errorText: 'not valid email',

    ).isValid(value)==false) {

      return 'not valid email' ;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.blue[100],
       body: Form(
         key: formKey,
         autovalidateMode:AutovalidateMode.onUserInteraction ,
         child: Center(
           child: Padding(
             padding:  EdgeInsets.symmetric(horizontal: defoltpading),
             child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                   Text('Forget Your password',
                     style: TextStyle(
                       fontSize: 30,
                         color: Colors.white,
                         fontWeight:FontWeight.bold

                     ),
                   ),
                 SizedBox(height: 10),
                 Text('Conferm Your Email And Will Send The \n Instructor',
                   style: TextStyle(
                     fontSize: 15,
                     fontWeight: FontWeight.w500
                   ),
                 ),
                 SizedBox(height: 10),
                  TextFormField(
                    validator: validatemail,
                    decoration:InputDecoration(
                      fillColor: Colors.white60,
                      filled: true,
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.blue,
                      ),


                    ) ,
                  ),
                 SizedBox(height: 10),

                 ElevatedButton(
                   style: ElevatedButton.styleFrom(
                       minimumSize: Size(400, 40)
                   ),
                   onPressed: (){
                     if(formKey.currentState!.validate()){
                      print('done');
                      setState(() {
                        isvald=true;


                      });
                     }else{
                       setState(() {
                         isvald=false;
                       });
                     }
                   },
                   child: Text('Submit',
                     style: TextStyle(
                         fontSize: 20
                     ),
                   ),
                 ),
                 Visibility(visible: isvald==true,child: Text('Done')),

                 SizedBox(height: 10),

                      TextButton(onPressed: (){
                        Navigator.pop(context);
                      }, child: Text('Back to login',
                        style: TextStyle(
                          fontSize: 20
                        ),
                      ),
                      )
               ],
             ),
           ),
         ),
       ),
    );
  }
}
