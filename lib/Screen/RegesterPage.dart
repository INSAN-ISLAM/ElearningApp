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
  final TextEditingController firstNameETController = TextEditingController();
  final TextEditingController lastNameETController = TextEditingController();
  final TextEditingController mobileETController = TextEditingController();
  final TextEditingController passwordETController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool m=true;
  // final _auth=FirebaseAuth.instance;
  // late String email;
  // late String password;
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
                  'Get Started With',
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
                  controller: firstNameETController,
                  hintText: 'First Name ',
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Enter your first name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                AppTextFieldWidget(
                  controller: lastNameETController,
                  hintText: 'Last Name',
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
                     // final user=   await _auth.createUserWithEmailAndPassword(
                     //   email: email,
                     //   password: password,
                     // );
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const LogInSreen()));
                        showSnackBarMessage(
                         context, 'Registration successful!');
                      } catch (e) {
                        showSnackBarMessage(context,
                            'Registration Failed! Try again', true);
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
