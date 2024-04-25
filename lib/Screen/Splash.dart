import 'package:demo_project/Screen/profile_Page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Style/ElevatedButton.dart';
import 'LoginPage.dart';
import 'RegesterPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  height: 200,
                  width: 250,
                  decoration: BoxDecoration(
                    // borderRadius: BorderRadius.zero,
                    border: Border.all(color: Colors.black,),
                  ),
                  child: Center(
                    child: Image.asset("assets/images/TutorTime.jpg",
                      height: 220,
                      width: 150,
                      fit: BoxFit.scaleDown,
                      //color: Colors.white
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              AppElevatedButton(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LogInSreen()));

                  //Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));

                 },


                child: Center(
                  child: Text(
                    "GET STARED",
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
              SizedBox(
                height: 14,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?"),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Register_Page()));
                    },
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(color: Colors.green),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
