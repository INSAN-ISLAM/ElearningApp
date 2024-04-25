import 'package:demo_project/Screen/practice.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../Style/App_TextField.dart';
import '../Style/ElevatedButton.dart';
import '../utils/SnakBar.dart';
import 'ResetPassword.dart';
import 'Splash.dart';
import 'bottom_nav_bar.dart';
import 'package:firebase_core_web/firebase_core_web.dart';
import 'package:google_sign_in_web/google_sign_in_web.dart';

class LogInSreen extends StatefulWidget {
  const LogInSreen({Key? key}) : super(key: key);

  @override
  State<LogInSreen> createState() => _LogInSreenState();
}

class _LogInSreenState extends State<LogInSreen> {

  final TextEditingController _emailETController = TextEditingController();
  final TextEditingController _passwordETController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool m=true;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;


  Future<void> _login() async {
    try {
      final result = await FirebaseAuth.instance.signInWithEmailAndPassword(
         email: _emailETController.text,
        password: _passwordETController.text,
      );
      // User logged in successfully
      Navigator.push(context, MaterialPageRoute(builder: (context) => const DashBord()));
      print('User logged in: ${result.user!.uid}');
    } catch (e) {

      print('Error logging in: $e');
    }
  }



  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );
        final UserCredential authResult = await _auth.signInWithCredential(credential);
        final User? user = authResult.user;
      // return user;
        if (user != null) {
          // Navigate to the next screen or perform any required actions
          Navigator.push(context, MaterialPageRoute(builder: (context) => const DashBord()));


        }




      }
    } catch (error) {
      print(error);
      return null;
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
                Center(
                    child: Container(
                      height: 120,
                      width: 200,
                      child:SvgPicture.asset('assets/images/classroom-icon.svg',height: 100, width: 128,
                        fit: BoxFit.scaleDown,
                        color: Color(0xFF333A51),
                      ),
                    )
                ),

                const SizedBox(
                  height:15,
                ),
                Center(
                  child: Text(
                      'Login to your account & start delivering.',

                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          color: Color(0xFF6A7189),
                          fontSize:16,
                        ),
                      )
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                AppTextFieldWidget(
                  controller: _emailETController,
                  prefixIcon: Icon(Icons.mail_lock_outlined),
                  hintText: 'Enter Your Email',
                  validator: (value) {
                    if (value?.isEmpty ?? true)  {
                      return 'Enter your valid email';
                    }
                    return null;
                  },

                ),
                const SizedBox(
                  height: 12,
                ),
                AppTextFieldWidget(
                  obscureText: m,
                  prefixIcon: Icon(Icons.key),
                  hintText: 'Enter Your Password',
                  controller: _passwordETController,
                  suffixIcon: IconButton(icon:const Icon(Icons.remove_red_eye_outlined),
                    onPressed: (){
                      setState(() {
                        m=!m;
                      });
                    },

                  ),
                  validator: (value) {
                    if ((value?.isEmpty ?? true) &&
                        ((value?.length ?? 0) < 6))  {
                      return 'Enter password more than 6';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 12,
                ),
                Container(
                  height: 48,
                  width: 358,
                  child: AppElevatedButton(
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        _login();


                      }
                    },




                    child:  Center(
                      child: Text("Login",
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontSize: 14,
                            //fontWeight: FontWeight.w700,

                          ),
                        ),

                      ),
                    ),
                  ),
                ), const SizedBox(
                  height:14,
                ),
                Center( child: TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ResetPassword()));
                      },
                      child:  Text('Forgot Password?',
                        style:GoogleFonts.poppins(
                          textStyle: TextStyle(
                            color: Color(0xFFEF232F),
                            fontSize: 14,
                          ),
                        ),

                      ),
                    ),
                    ),


                const SizedBox(
                  height:14,
                ),


                      Center(
                        child: Text(
                          'OR.',
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                              color: Color(0xFF6A7189),
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),

                const SizedBox(
                  height: 12,
                ),

                AppElevatedButton(
                  onTap: ()  async {

                   // await FirebaseServices().signInWithGoogle();

                    signInWithGoogle();


                    //Navigator.push(context, MaterialPageRoute(builder: (context) => const DashBord()));

                  },
                  child:  Center(
                    child: Text("SIGN IN WITH GOOGLE",
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontSize: 14,
                          //fontWeight: FontWeight.w700,

                        ),
                      ),

                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );




  }
}
