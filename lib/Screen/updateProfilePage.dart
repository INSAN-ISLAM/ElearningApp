import 'dart:convert';
import 'dart:html';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:googleapis/binaryauthorization/v1.dart';
import 'package:image_picker/image_picker.dart';
import '../DATA/data.dart';
import '../Style/App_TextField.dart';
import '../Style/ElevatedButton.dart';
import '../Style/TextStyle.dart';
import '../utils/SnakBar.dart';

class UpdateProfileScreen extends StatefulWidget {
   UpdateProfileScreen({Key? key}) : super(key: key);

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}
class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  final TextEditingController _emailETController = TextEditingController();
  final TextEditingController _NameETController = TextEditingController();
  final TextEditingController _class_NameETController = TextEditingController();
  final TextEditingController _mobileETController = TextEditingController();
  final TextEditingController _bloodETController = TextEditingController();
  final TextEditingController _passwordETController = TextEditingController();

  XFile? pickedImage;
  String? base64Image;


  Future<void> updateProfile() async {

    if (imgUrl!.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Url is a empty')));
      return;
    }

    try {


      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {

        print(user.uid);
        final result=FirebaseFirestore.instance.collection('Check').doc(user.uid).update({
            'name': _NameETController.text,
            'mobile': _mobileETController.text,
            'email': _emailETController.text,
            'Blood': _bloodETController.text,
            'Class Name': _class_NameETController.text,
            'password': int.tryParse(_passwordETController.text) ?? 0,
            'image':  imgUrl ?? ''
          });






      }


















      // final result=FirebaseFirestore.instance.collection('Check').doc('0gfYD4SPVODjcDQZufb5').update({
      //   'name': _NameETController.text,
      //   'mobile': _mobileETController.text,
      //   'email': _emailETController.text,
      //   'Blood': _bloodETController.text,
      //   'ClassName': _class_NameETController.text,
      //   'password': int.tryParse(_passwordETController.text) ?? 0,
      //   'image':  imgUrl ?? ''
      // });

     //rint('User signed up: ${result.Check!.uid}');

    } catch (e) {
      // Error occurred during signup
      print('Error signing up: $e');
      // showSnackBarMessage(context as BuildContext, 'Registration Failed! Try again', true);
    }
  }
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
      body: SafeArea(
        child: Column(
          children: [
           // const UserProfileWidget(),
            Expanded(
              child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 24,
                          ),
                          Text(
                            'Update Profile',
                            style: screenTitleTextStyle,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          InkWell(
                            onTap: () async {
                              //pickImage();
                              uploadToStorage();


                            },
                            child: Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(16),
                                  decoration: const BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(8),
                                        bottomLeft: Radius.circular(8),
                                      )),
                                  child: const Text('Photo'),
                                ),
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.all(16),
                                    decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(8),
                                          bottomRight: Radius.circular(8),
                                        )),
                                    child: file != null
                                        ? Text(' image selected.')//
                                        : Text('No image selected.'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),

                          AppTextFieldWidget(
                            hintText: ' Name',
                            controller: _NameETController,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          AppTextFieldWidget(
                            hintText: 'Class_Name',
                            controller: _class_NameETController,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          AppTextFieldWidget(
                            hintText: 'Mobile',
                            controller: _mobileETController,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          AppTextFieldWidget(
                            hintText: 'Blood Group',

                            controller: _bloodETController,
                          ),
                          const SizedBox(
                            height: 16,
                          ),

                          AppElevatedButton(
                            child: const Text("Submit"),
                            onTap: () {
                              updateProfile();
                              showSnackBarMessage(
                                  context, 'updateProfile successful!');
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
          ],
        ),
      ),
    );
  }

  void pickImage() async {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Pick image from'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  onTap: () async {
                    pickedImage = await ImagePicker()
                        .pickImage(source: ImageSource.camera);
                    if (pickedImage != null) {
                      setState(() {});
                    }
                  },
                  leading: const Icon(Icons.camera),
                  title: const Text('Camera'),
                ),
                ListTile(
                  onTap: () async {
                    pickedImage = await ImagePicker()
                        .pickImage(source: ImageSource.gallery);
                    if (pickedImage != null) {
                      setState(() {});
                    }
                  },
                  leading: const Icon(Icons.image),
                  title: const Text('Gallery'),
                ),
              ],
            ),
          );
        });
  }

}