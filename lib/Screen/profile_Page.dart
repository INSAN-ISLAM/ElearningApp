import 'dart:html';

import 'package:demo_project/Screen/practice.dart';
import 'package:demo_project/Screen/updateProfilePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../Quiz_System/screens/welcome/welcome_screen.dart';
import 'Assain_Sub.dart';
import 'ChatApp_Screen.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  ButtonStyle buttonStyles = ElevatedButton.styleFrom(
    padding: const EdgeInsets.symmetric(vertical: 25.2, horizontal: 80.5),
    backgroundColor: Colors.white,
    foregroundColor: Colors.black,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20.0),
      side: const BorderSide(
        color: Color(0xFF000000),
      ), // Border color
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Expanded(
            //   flex: 30,
            //   child:
          Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(width: 10),
                  Container(
                    color: Colors.black45,
                    child: SizedBox(
                      height: 120,
                      width: 100,
                      child:Image.asset("assets/images/Ruhul Amin.jpg",height: 120,width: 150,fit: BoxFit.fill),
                    ),
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Name:Ruhul Amin',
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            color: Colors.black,

                            fontSize: 15,

                            //fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      SizedBox(width: 15),
                      Text(
                        "Clas: 9",
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            color: Colors.black,

                            fontSize: 15,

                            //fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Blood Group: o+",
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            color: Colors.black,

                            fontSize: 15,

                            //fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      //SizedBox(height:7),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: OutlinedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          UpdateProfileScreen()));
                            },
                            child: Text('Profile Update'),
                            style: buttonStyles),
                      ),
                    ],
                  ),
                ],
              ),
           // ),
            SizedBox(height: 6,),
        Text("Our CLass",
        style:  GoogleFonts.poppins(
          textStyle: const TextStyle(
            color: Colors.black,

            fontSize: 25,

            //fontWeight: FontWeight.w700,
          ),
        ),

        ),



            SizedBox(height: 6,),
            Row(
              children: [

                Expanded(
                  flex: 50,
                  child:Container(
                    width: double.infinity,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.zero,
                      border:
                      Border.all(color: Colors.black,),
                    ),
                    child:Image.asset("assets/images/Class2.jpg",height: 120,width: 150,fit: BoxFit.fill),
                  ),
                ),

                SizedBox(width: 5,),
                Expanded(
                  flex: 50,
                  child: Container(
                    width: double.infinity,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.zero,
                      border:
                      Border.all(color: Colors.black,),
                    ),
                    child: TextButton(

                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ZoomLinkPage()));
                      },
                      child: Image.asset("assets/images/zoom.png",height: 120,width: 150,fit: BoxFit.scaleDown),

                    ),
                  ),
                ),

              ],
            ),
            SizedBox(height: 6,),
            Row(
              children: [

                Expanded(
                  flex: 50,
                  child:Container(
                    width: double.infinity,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.zero,
                      border: Border.all(color: Colors.black,),
                    ),
                    child:Image.asset("assets/images/Quiz.jpg",height: 120,width: 150,fit: BoxFit.fill),
                  ),
                ),

                SizedBox(width: 5,),
                Expanded(
                  flex: 50,
                  child: Container(
                    width: double.infinity,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.zero,
                      border: Border.all(color: Colors.black,),
                    ),
                    child: TextButton(

                      onPressed: () {

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WelcomeScreen()));


                       // Get.put(WelcomeScreen());
                      },
                      child: Image.asset("assets/images/zoom.png",height: 120,width: 150,fit: BoxFit.scaleDown),

                    ),
                  ),
                ),

              ],
            ),

            SizedBox(height: 6,),


             Row(
                //crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 50,
                    child: Container(
                      width: double.infinity,
                      height: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.black,),
                      ),
                      child: OutlinedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FileUploadScreen()));
                          },
                          child: Text('Assainment Submit',
                          style: TextStyle(
                            color: Colors.black
                          ),
                          ),
                          //style: buttonStyles),
                    ),
                  ),),
                  SizedBox(
                    width: 15,
                  ),
                  
                  Expanded(
                    flex: 50,
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.black,),
                      ),
                      height: 70,
                     // width: 250,
                      // margin: const EdgeInsets.only(
                      //     left: 30, right: 30, top: 20, bottom: 10),
                      // padding: EdgeInsets.only(left: 20),
                      child: OutlinedButton(
                        //style: const ButtonStyle(),

                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                 builder: (context) =>  ChatScreen()));
                        },
                        child: Text('Chat With Us',
                            style: TextStyle(
                            color: Colors.black
                        ),),
                        // style: buttonStyles,
                      ),
                    ),
                  ),
                ],
              ),

          ],
        ),
      ),
    );
  }
}
class ZoomLinkPage extends StatefulWidget {
  const ZoomLinkPage({Key? key}) : super(key: key);

  @override
  State<ZoomLinkPage> createState() => _ZoomLinkPageState();
}

class _ZoomLinkPageState extends State<ZoomLinkPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 50,),
        Center(
          child: Container(
            height:76 ,
            width: 233,

            child: TextFormField(

            decoration: InputDecoration(
              fillColor: Colors.white,
              hintText:'Zoom Link',
              hintStyle:TextStyle(
                color: Color(0xFF6A7189),
                fontSize: 16,
              ),
              filled: true,
              border: const OutlineInputBorder(
                //borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Colors.transparent),
              ),
             


            ),
      ),
          ),
        ),

          Center(
            child: Container(
              color: Colors.grey,
              height:20 ,
              width: 50,
              child:TextButton(onPressed: (){}, child: Text("Go",
                style: TextStyle(
                  fontSize: 20,
                    color: Colors.black
                ),

              )),
            ),
          ),


        ],
      ),


    );
  }
}
