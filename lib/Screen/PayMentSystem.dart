

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Style/App_TextField.dart';
import '../Style/ElevatedButton.dart';
import '../utils/SnakBar.dart';
import 'Home_Page.dart';
import 'bottom_nav_bar.dart';
class PayMentSystem extends StatefulWidget {
  const PayMentSystem({Key? key}) : super(key: key);

  @override
  State<PayMentSystem> createState() => _PayMentSystemState();
}

class _PayMentSystemState extends State<PayMentSystem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            SizedBox(height: 20),
            Text(
              'PayMent',
              style: GoogleFonts.poppins(
                textStyle: const TextStyle(
                  color: Colors.black,

                  fontSize: 30,

                  //fontWeight: FontWeight.w700,
                ),
              ),
            ),

            SizedBox(height: 50),
            Center(
              child: OutlinedButton(
                onPressed: () {

                  Navigator.push(context, MaterialPageRoute(builder: (context) => const PayMentPage()));
                },
                child: SvgPicture.asset(
                  'assets/images/BKashLogo.svg',
                  height: 100,
                  width: 108,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: OutlinedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const PayMentPage(


                  )));
                },
                child: SvgPicture.asset(
                  'assets/images/NagadLogo.svg',
                  height: 120,
                  width: 200,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class PayMentPage extends StatefulWidget {
  const PayMentPage({Key? key}) : super(key: key);

  @override
  State<PayMentPage> createState() => _PayMentPageState();
}

class _PayMentPageState extends State<PayMentPage> {

  final TextEditingController _emailETController = TextEditingController();
  final TextEditingController _passwordETController = TextEditingController();
  final TextEditingController _AmountETController = TextEditingController();
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
                      child:SvgPicture.asset('assets/images/BKashLogo.svg',height: 100, width: 128,
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
                  hintText: 'Account Number',
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return ' Wrong  Number ';
                    }
                    return null;
                  },

                ),
                const SizedBox(
                  height: 12,
                ),

                AppTextFieldWidget(
                  controller: _AmountETController,
                  hintText: 'Amount',

                ),

                const SizedBox(
                  height: 12,
                ),

                AppTextFieldWidget(
                  controller: _passwordETController,
                  hintText: 'Reference Code',

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
                       showSnackBarMessage(
                           context, 'Send successful!');
                      }

                    },




                    child:  Center(
                      child: Text("Submit",
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

              ],
            ),
          ),
        ),
      ),
    );




  }
}
