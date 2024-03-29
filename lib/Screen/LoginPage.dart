import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Style/App_TextField.dart';
import '../Style/ElevatedButton.dart';
import 'bottom_nav_bar.dart';
import 'package:firebase_core_web/firebase_core_web.dart';

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
                  hintText: 'Enter Your Email',
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
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
                        ((value?.length ?? 0) < 6)) {
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
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const DashBord()));
                      //   if(user!=null) {
                      //   Navigator.push(context, MaterialPageRoute(builder: (context) => const DashBord()));
                      // }
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
                  onTap: ()  {

                      Navigator.push(context, MaterialPageRoute(builder: (context) => const DashBord()));

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
