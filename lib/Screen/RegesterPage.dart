import 'dart:js';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_project/Screen/profile_Page.dart';
import 'package:demo_project/Screen/updateProfilePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Style/App_TextField.dart';
import '../Style/ElevatedButton.dart';
//import '../Style/TextFieldStyle.dart';
import '../Style/TextStyle.dart';
import '../utils/SnakBar.dart';
import 'bottom_nav_bar.dart';
import 'LoginPage.dart';
//import 'bottom_nav_bar.dart';



class Register_Page extends StatelessWidget {
  Register_Page({Key? key}) : super(key: key);
  final TextEditingController emailETController = TextEditingController();
  final TextEditingController NameETController = TextEditingController();
  final TextEditingController bloodNameETController = TextEditingController();
  final TextEditingController mobileETController = TextEditingController();
  final TextEditingController passwordETController = TextEditingController();
  final TextEditingController ClassNameETController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool m=true;

  Future<void> _signUp() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailETController.text,
        password: passwordETController.text,
     ).then((value) async {

        FirebaseFirestore.instance.collection('Check').doc(value.user!.uid).set({
          'name': NameETController.text,
          'mobile': mobileETController.text,
          'email': emailETController.text,
          'Blood': bloodNameETController.text,
          'Class Name': ClassNameETController.text,
          'password': int.tryParse(passwordETController.text) ?? 0,
        });
        return value;

     } );


      //print('User signed up: ${userCredential.user!.uid}');

    } catch (e) {
      // Error occurred during signup
      print('Error signing up: $e');
     // showSnackBarMessage(context as BuildContext, 'Registration Failed! Try again', true);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Get Registation ',
                  style: screenTitleTextStyle,
                ),
                SizedBox(height: 20),
                AppTextFieldWidget(
                  controller: emailETController,
                  hintText: 'Email',
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Enter your valid email';
                    }
                    return null;
                  },
                  onChanged: (value){
                 // email=value!;

                  },

                ),
                SizedBox(height: 20),
                AppTextFieldWidget(
                  controller: NameETController,
                  hintText: 'Name',
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Enter your first name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                AppTextFieldWidget(
                  controller: bloodNameETController,
                  hintText: 'Blood Group',
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Enter your last name';
                    }
                    return null;
                  },

                ),
                SizedBox(height: 20),
                AppTextFieldWidget(
                  controller: mobileETController,
                  hintText: 'Mobile',
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Enter your valid mobile';
                    }
                    return null;
                  },

                ),

                SizedBox(height: 20),
                AppTextFieldWidget(
                  controller: ClassNameETController,
                  hintText: 'Class Name',
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Enter your valid mobile';
                    }
                    return null;
                  },

                ),
                SizedBox(height: 20),
                AppTextFieldWidget(
                  controller: passwordETController,
                  hintText: 'Password',
                  obscureText: true,
                  validator: (value) {
                    if ((value?.isEmpty ?? true) &&
                        ((value?.length ?? 0) < 6)) {
                      return 'Enter password more than 6';
                    }
                    return null;
                  },
                  onChanged: (value){
                  //email=value!;

                  },
                ),

                const SizedBox(height: 16),
                AppElevatedButton(
                  child: const Text('Registation'),
                  onTap:  ()  async {
                    if (_formKey.currentState!.validate()) {
                      try {
                        _signUp();
                       // Navigator.push(context, MaterialPageRoute(builder: (context) => const LogInSreen()));

                      } catch (e) {

                      }

                  //  Navigator.pop(context);
                    }
                    //

                  },

                ),

                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Have an account?"),
                    TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const LogInSreen()));
                      },
                      child: const Text(
                        'Sign In',
                        style: TextStyle(color: Colors.green),
                      ),
                    )
                  ],
                ),

              ],
            ),
          ),
        ),
      ),

    );
  }
}
