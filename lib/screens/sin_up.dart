import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../constans.dart';

class sinup extends StatefulWidget {
  const sinup({Key? key}) : super(key: key);

  @override
  State<sinup> createState() => _sinupState();
}

class _sinupState extends State<sinup> {
  bool isvald=false;
  bool pass =true ;
  String? validatepass(String? value) {
    if (value!.isEmpty) {
      return ' requid';
    } else if (value.length < 6 || value.length > 15) {
      return 'password betwin 6 and 15';
    } else {
      return null;
    }
  }
  String? validatemail (String? value){
    if(value!.isEmpty){
      return 'requid' ;
    }else if(  EmailValidator(

      errorText: 'not valid email',

    ).isValid(value)==false) {

      return 'not valid email' ;
    }
  }
  String? validatname (String? value){
    if(value!.isEmpty){
      return 'requir' ;
    }else if(value.length<3||value.length>10){
      return 'name betwin 3 and 10';
    }
  }
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('back'),
        elevation: 0,
        backgroundColor: Colors.blue[100],
      ),
      backgroundColor: Colors.blue[100],
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: defoltpading,vertical: defoltpading),
        child: Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Sign Up',
                  style: Theme.of(context).textTheme.headline4?.copyWith(
                      color: Colors.black,
                      fontWeight:FontWeight.bold

                  ),
                ),
                SizedBox(height: 15,),
                Text('Sign up to join',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 50,),
                TextFormField(
                  validator: validatname,
                  decoration:InputDecoration(
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.blue,
                    ),
                    fillColor: Colors.white60,
                    filled: true,
                    hintText: 'Your name',



                  ) ,
                ),
                SizedBox(height: 20),
                TextFormField(
                  validator: validatemail,
                  decoration:InputDecoration(
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.blue,
                    ),
                    fillColor: Colors.white60,
                    filled: true,
                    hintText: 'Your Email Adress',



                  ) ,
                ),
                SizedBox(height: 20),
                TextFormField(
                  obscureText: pass,

                  validator:validatepass ,

                  decoration:InputDecoration(
                      suffixIcon: IconButton(
                        icon: pass? Icon(Icons.remove_red_eye_outlined) :Icon(Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            pass = !pass;
                          });
                        },
                      ),
                      prefixIcon:  Icon(
                        Icons.lock,
                        color: Colors.blue,
                      ),
                      fillColor: Colors.white60,
                      filled: true,
                      hintText: 'Your Password'

                  ) ,
                ),
                SizedBox(height: 20),

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
                  child: Text('Sign up',
                    style: TextStyle(
                        fontSize: 20
                    ),
                  ),

                ),
                Center(child: Visibility(visible: isvald==true,child: Text('Done'))),
                SizedBox(height: 10),

                Center(
                  child: TextButton(onPressed: (){
                    Navigator.pop(context);
                  }, child: Text('Back to login',
                    style: TextStyle(
                        fontSize: 20
                    ),
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
