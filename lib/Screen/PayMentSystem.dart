

import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

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












 // XFile? pickedImage;
 // String? base64Image;

// uncomplete action

  String? imgUrl;
  String? file;
  uploadToStorage() {
    FileUploadInputElement input = FileUploadInputElement();
    input.accept = 'image*/';
    FirebaseStorage fs = FirebaseStorage.instance;
    input.click();
    input.onChange.listen((event) {
      final file = input.files?.first;
      final reader = FileReader();
      reader.readAsDataUrl(file!);
      reader.onLoadEnd.listen((event) async {
        var snapshot = await fs.ref().child('newfile').putBlob(file);
        String downloadUrl = await snapshot.ref.getDownloadURL();
        setState(() {
          imgUrl = downloadUrl;
        });
      });
    });
  }












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
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const PayMentPage1(


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
  final TextEditingController _ClassETController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool m=true;

  Future<void> updateProfile() async {
    try {
      final result=FirebaseFirestore.instance.collection('Your purches').add({
        'ClassName':  _ClassETController.text , // eETController.text,par Youpurses
        //'image':  imgUrl ?? '' ,
      });     //

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
                  hintText: 'PayMentSystem',

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
                AppTextFieldWidget(
                  controller: _ClassETController,
                  hintText: 'Class Name & subject',

                ),
                const SizedBox(
                  height: 12,
                ),
                Container(
                  height: 48,
                  width: 358,
                  child: AppElevatedButton(
                    onTap: () {

                      if (_formKey.currentState!.validate()) {
                       Navigator.push(context, MaterialPageRoute(builder: (context) => const DashBord()));
                        //   if(user!=null) {
                        //   Navigator.push(context, MaterialPageRoute(builder: (context) => const DashBord()));
                        // }

                       updateProfile();




                        showSnackBarMessage(context, 'Send successful!');

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
class PayMentPage1 extends StatefulWidget {
  const PayMentPage1({Key? key}) : super(key: key);

  @override
  State<PayMentPage1> createState() => _PayMentPage1State();
}

class _PayMentPage1State extends State<PayMentPage1> {

  final TextEditingController _emailETController = TextEditingController();
  final TextEditingController _passwordETController = TextEditingController();
  final TextEditingController _AmountETController = TextEditingController();
  final TextEditingController _ClassETController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool m=true;


  Future<void> updateProfile() async {

    // if (imgUrl!.isEmpty) {
    //   ScaffoldMessenger.of(context)
    //       .showSnackBar(SnackBar(content: Text('Url is a empty')));
    //
    //   return;
    // }


    try {
      // UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      //   email: emailETController.text,  //update
      //   password: passwordETController.text,
      // );
      final result=FirebaseFirestore.instance.collection('Your purches').add({


        'ClassName':  _ClassETController.text , // eETController.text,par Youpurses
        //'image':  imgUrl ?? '' ,
      });     //

      //rint('User signed up: ${result.Check!.uid}');

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
                Center(
                    child: Container(
                      height: 120,
                      width: 200,
                      child:SvgPicture.asset(
                        'assets/images/NagadLogo.svg',
                        height: 120,
                        width: 200,
                        fit: BoxFit.fill,
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
                  hintText: 'PayMentSystem',

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
                AppTextFieldWidget(
                  controller: _ClassETController,
                  hintText: 'Class Name & subject',

                ),

                const SizedBox(
                  height: 12,
                ),
                Container(
                  height: 48,
                  width: 358,
                  child: AppElevatedButton(
                    onTap: () {

                      if (_formKey.currentState!.validate()) {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const DashBord()));
                        //   if(user!=null) {
                        //   Navigator.push(context, MaterialPageRoute(builder: (context) => const DashBord()));
                        // }



                        updateProfile();


                        showSnackBarMessage(context, 'Send successful!');

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





List<Map<String, dynamic>> _data = [
  {
    "image":"assets/images/Class2.jpg",
    "title": "গনিত – পরিসংখ্যান ",
    "title1": "১। সংক্ষিপ্ত পদ্ধতিতে গড় নির্ণয়",
    "title2": "২। মধ্যক নির্ণয়",
    "title3": "৩। প্রচুরক নির্ণয়",
    "title4": "৪। অজীব রেখা নির্ণয়",
    "title5": "Reference Code:420",
    "Price": "Class time – 5.00 pm (24.03.24)"
  },

  {
    "image":"assets/images/class4.jpg",
    "title": "জীববিজ্ঞান – জীবনীশক্তি",
    "title1": "১। বায়োলজিক্যাল কয়েন",
    "title2": "২। ৩৮ ATP শক্তি তৈরী ",
    "title3": "৩। আলোক নির্ভর ও অন্ধকার পর্যায়",
    "title5": "Reference Code:410",
    "Price": "Class time – 5.00 pm (24.03.24)"
  },

  {
    "image": "assets/images/Class3.jpg",
    "title": "রসায়ন –খনিজ সম্পদ ",
    "title1": "১। আকরিক থেকে ধাতু",
    "title2": "২। ধাতু নিষ্কাশন",
    "title3": "৩। বাত্যাচুল্লি",
    "title4": "জিঙ্ক ধাতু নিষ্কাশন",
    "title5": "Reference Code:400",
    "Price": "Class time – 5.00 pm (24.03.24)"
  },

  {
    "image":"assets/images/Quiz.jpg",
    "title": "জীববিজ্ঞান – কোষ বিভাজন  ",
    "title1": "১। মাইটোসিস কোষ বিভাজন",
    "title2": "২। মিয়োসিস কোষ বিভাজন",
    "title3": "৩। নতুন বংশবিস্তার",
    "title4": "৪। DNA অনুলিপণ",
    "title5": "Reference Code:401",
    "Price": "Exam time – 5.00 pm (24.03.24)"
  },


];
