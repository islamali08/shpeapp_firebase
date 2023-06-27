import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:shop_f/screens/sin_up.dart';

import '../constans.dart';
import '../main_catagory/most_popular.dart';
import '../main_catagory/women_catagory.dart';
import 'forget_pass.dart';
import 'home_screen.dart';

class loginscreen extends StatefulWidget {
  const loginscreen({Key? key}) : super(key: key);

  @override
  State<loginscreen> createState() => _loginscreenState();
}

class _loginscreenState extends State<loginscreen> {
  bool pass = true;

  String? validatepass(String? value) {
    if (value!.isEmpty) {
      return ' requid';
    } else if (value.length < 6 || value.length > 15) {
      return 'password betwin 6 and 15';
    } else {
      return null;
    }
  }

  String? validatemail(String? value) {
    if (value!.isEmpty) {
      return 'requid';
    } else if (EmailValidator(
          errorText: 'not valid email',
        ).isValid(value) ==
        false) {
      return 'not valid email';
    }
  }

  var formKey = GlobalKey<FormState>();

  valid() {
    if (formKey.currentState!.validate()) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return mostpopular();
      }));
      print('yes');
    } else {
      print('no');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.lightBlueAccent[100],
        title: Text(
          'Login',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: Colors.lightBlueAccent[100],
      body: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: defoltpading),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image(
                    height: 250,
                    image: AssetImage(
                        'assets/images/onlines-removebg-preview.png'),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Email',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 8,
                ),
                TextFormField(
                  validator: validatemail,

                  decoration: InputDecoration(

                    prefixIcon: Icon(

                      Icons.email,
                      color: Colors.blue,
                    ),

                    fillColor: Colors.white60,
                    filled: true,
                    hintText: 'Your Email Adress',

                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  'password',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 8,
                ),
                TextFormField(
                  obscureText: pass,
                  validator: validatepass,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: pass? Icon(Icons.remove_red_eye_outlined) :Icon(Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            pass = !pass;
                          });
                        },
                      ),
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.blue,
                      ),
                      fillColor: Colors.white60,
                      filled: true,
                      hintText: 'Your Password'),
                ),
                SizedBox(
                  height: 5,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return forgetpass();
                        }),
                      );
                    },
                    child: Text('Forget my password?'),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(minimumSize: Size(400, 50)),
                    onPressed: () {
                      valid();
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't Have acount ?",
                      style: TextStyle(fontSize: 15),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return sinup();
                          }),
                        );
                      },
                      child: Text('Sign up'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
