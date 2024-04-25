import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_project/Screen/practice.dart';
import 'package:demo_project/Screen/updateProfilePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:googleapis/appengine/v1.dart';
import 'package:googleapis/appengine/v1.dart';
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

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late Future<DocumentSnapshot> _documentFuture;

  @override
  void initState() {
    super.initState();
    _documentFuture = _getDocument();
  }

  Future<DocumentSnapshot> _getDocument() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      print(user!.uid);
      return await _firestore.collection('Check').doc(user?.uid).get();
    } catch (e) {
      throw Exception('Error fetching document: $e');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: FutureBuilder(
            future: _documentFuture,
            builder: (BuildContext context,
                AsyncSnapshot<DocumentSnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              if (!snapshot.hasData || !snapshot.data!.exists) {
                return Center(child: Text('Document does not exist'));
              }
              Map<String, dynamic> data =
                  snapshot.data!.data() as Map<String, dynamic>;
              return Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(width: 10),
                      Container(
                        color: Colors.black45,
                        child: SizedBox(
                            height: 120,
                            width: 100,
                            child: Image.network(
                              "${data['image']}",
                              fit: BoxFit.fill,
                            )),
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Name:${data['name']}',
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
                            "Class: ${data['Class Name']}",
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
                            "Blood Group: ${data['Blood']}",
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
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    "Our CLass",
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        color: Colors.black,

                        fontSize: 25,

                        //fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 6,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 50,
                        child: Container(
                          width: double.infinity,
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.zero,
                            border: Border.all(
                              color: Colors.black,
                            ),
                          ),
                          child: Image.asset("assets/images/Quiz.jpg",
                              height: 120, width: 150, fit: BoxFit.fill),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        flex: 50,
                        child: Container(
                          width: double.infinity,
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.zero,
                            border: Border.all(
                              color: Colors.black,
                            ),
                          ),
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => WelcomeScreen()));

                              // Get.put(WelcomeScreen());
                            },
                            child: Image.asset("assets/images/zoom.png",
                                height: 120, width: 150, fit: BoxFit.scaleDown),
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 6,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 50,
                        child: Container(
                          width: double.infinity,
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.zero,
                            border: Border.all(
                              color: Colors.black,
                            ),
                          ),
                          child: Image.asset("assets/images/Class2.jpg",
                              height: 120, width: 150, fit: BoxFit.fill),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        flex: 50,
                        child: Container(
                          width: double.infinity,
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.zero,
                            border: Border.all(
                              color: Colors.black,
                            ),
                          ),
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => WelcomeScreen()));

                              // Get.put(WelcomeScreen());
                            },
                            child: Image.asset("assets/images/zoom.png",
                                height: 120, width: 150, fit: BoxFit.scaleDown),
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 6,
                  ),

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
                            border: Border.all(
                              color: Colors.black,
                            ),
                          ),
                          child: OutlinedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          FileUploadScreen()));
                            },
                            child: Text(
                              'Assainment Submit',
                              style: TextStyle(color: Colors.black),
                            ),
                            //style: buttonStyles),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        flex: 50,
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Colors.black,
                            ),
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
                                      builder: (context) => chatpage(
                                            email: 'b2@gmail.com',
                                          )));
                            },
                            child: Text(
                              'Chat With Us',
                              style: TextStyle(color: Colors.black),
                            ),
                            // style: buttonStyles,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            }),
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
          SizedBox(
            height: 50,
          ),
          Center(
            child: Container(
              height: 76,
              width: 233,
              child: TextFormField(
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  hintText: 'Zoom Link',
                  hintStyle: TextStyle(
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
        ],
      ),
    );
  }
}
