import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:html' as html;
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:file_picker/file_picker.dart';
import 'dart:convert';
import 'dart:typed_data';
import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:ui_web';





class FileUploadScreen extends StatefulWidget {
  @override
  _FileUploadScreenState createState() => _FileUploadScreenState();
}

class _FileUploadScreenState extends State<FileUploadScreen> {
  html.File? _selectedFile;
  Uint8List? _imageBytes;

  Future<void> _selectFile() async {
    final html.FileUploadInputElement input = html.FileUploadInputElement();
    input.accept = 'image*/'; // Restrict file types to images
    input.click();

    input.onChange.listen((event) {
      final files = input.files;
      if (files != null && files.isNotEmpty) {
        final reader = html.FileReader();
        reader.readAsArrayBuffer(files[0]);
        reader.onLoadEnd.listen((event) {
          setState(() {
            _selectedFile = files[0];
            _imageBytes = reader.result as Uint8List?;
          });
        });
      }
    });
  }

  Future<void> _uploadFile() async {
    if (_selectedFile == null) {
      // No file selected
      return;
    }

    // Create multipart request
    var url = Uri.parse('YOUR_UPLOAD_URL');
    var request = http.MultipartRequest('POST', url);

    // Add the file to be uploaded
    var multipartFile = http.MultipartFile.fromBytes(
      'file',
      _imageBytes!,
      filename: _selectedFile!.name,
    );
    request.files.add(multipartFile);

    // Send the request
    var response = await request.send();

    // Check the response status
    if (response.statusCode == 200) {
      // File uploaded successfully
      print('File uploaded');
    } else {
      // Error uploading file
      print('Error uploading file');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('File Upload '),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: _selectFile,
              child: Text('Select Image'),
            ),
            SizedBox(height: 20),
            if (_imageBytes != null)
              Image.memory(
                _imageBytes!,
                width: 200,
                height: 200,
              ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _uploadFile,
              child: const Text('Upload Image'),
            ),
          ],
        ),
      ),
    );
  }
}







































// // // File file = File( " ");
// // //
// // // class FileUploadScree extends StatefulWidget {
// // //   @override
// // //   _FileUploadScreeState createState() => _FileUploadScreeState();
// // // }
// // //
// // // class _FileUploadScreeState extends State<FileUploadScree> {
// // //
// // //
// // //
// // //
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         title: Text('File Upload Example'),
// // //       ),
// // //       body: Center(
// // //         child: Column(
// // //           mainAxisAlignment: MainAxisAlignment.center,
// // //           children: <Widget>[
// // //             Image.file(file),
// // //             SizedBox(height: 20),
// // //             ElevatedButton(
// // //               onPressed: (){
// // //
// // //                 pickfile();
// // //
// // //               },
// // //
// // //
// // //               child: Text('Upload File'),
// // //             ),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }
// // //
// // //   void pickfile() async {
// // //
// // //     FilePickerResult? result = await FilePicker.platform.pickFiles(
// // //       type: FileType.image,
// // //     );
// // //     if (result != null) {
// // //       setState(() {
// // //         file = File(result.files.single.path?? " ");
// // //       });
// // //     }
// // //   }
// // // }
// // //
// // // //=========================================================================================
//
// // //
// // //
// // //
// // //
// // //
// // //
// // // class FileUploadScreen extends StatefulWidget {
// // //   @override
// // //   _FileUploadScreeState createState() => _FileUploadScreeState();
// // // }
// // //
// // // class _FileUploadScreenState extends State<FileUploadScree> {
// // //   html.File? _selectedFile;
// // //   Uint8List? _imageBytes;
// // //   File? _imageFile;
// // //   Future<void> _selectFile() async {
// // //     final html.FileUploadInputElement input = html.FileUploadInputElement();
// // //     input.accept = 'image*/'; // Restrict file types to images
// // //     input.click();
// // //
// // //     input.onChange.listen((event) {
// // //       final files = input.files;
// // //       if (files != null && files.isNotEmpty) {
// // //         final reader = html.FileReader();
// // //         reader.readAsArrayBuffer(files[0]);
// // //         reader.onLoadEnd.listen((event) {
// // //           setState(() {
// // //             _selectedFile = files[0];
// // //             _imageBytes = reader.result as Uint8List?;
// // //           });
// // //         });
// // //       }
// // //     });
// // //   }
// // // //===================================================================
// // //   // Future<void> _uploadFile() async {
// // //   //   if (_selectedFile == null) {
// // //   //     // No file selected
// // //   //
// // //   //     print('file null');
// // //   //     return;
// // //   //   }
// // //   //
// // //   //   // Create multipart request
// // //   //   var url = Uri.parse('YOUR_UPLOAD_URL');
// // //   //   var request = http.MultipartRequest('POST', url);
// // //   //
// // //   //   // Add the file to be uploaded
// // //   //   var multipartFile = http.MultipartFile.fromBytes(
// // //   //     'file',
// // //   //     _imageBytes!,
// // //   //     filename: _selectedFile!.name,
// // //   //   );
// // //   //   request.files.add(multipartFile);
// // //   //
// // //   //   // Send the request
// // //   //   var response = await request.send();
// // //   //
// // //   //   // Check the response status
// // //   //   if (response.statusCode == 200) {
// // //   //     // File uploaded successfully
// // //   //     print('File uploaded');
// // //   //   } else {
// // //   //     // Error uploading file
// // //   //     print('Error uploading file');
// // //   //   }
// // //   // }
// // //
// // //   //====================================================================
// // //   Future<void> _uploadImage() async {
// // //     if (_selectedFile == null) {
// // //
// // //       print('file null');
// // //
// // //       // Handle case when no image is selected
// // //       return;
// // //     }
// // //     // Upload file to Firebase Storage
// // //     try {
// // //       String fileName = DateTime.now().millisecondsSinceEpoch.toString();
// // //       Reference ref = FirebaseStorage.instance.ref().child('images/$fileName.jpg');
// // //       await ref.putFile(_selectedFile as File);
// // //       // Get download URL of uploaded image
// // //       String imageUrl = await ref.getDownloadURL();
// // //
// // //       // Do something with imageUrl, like saving to Firestore or displaying in your app
// // //       print('Image uploaded successfully. URL: $imageUrl');
// // //     } catch (e) {
// // //       // Handle errors
// // //       print('Error uploading image: $e');
// // //     }
// // //   }
// // //
// // //
// // //
// // //
// // //
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         title: Text('File Upload '),
// // //       ),
// // //       body: Center(
// // //         child: Column(
// // //           mainAxisAlignment: MainAxisAlignment.center,
// // //           children: <Widget>[
// // //             ElevatedButton(
// // //               onPressed: _selectFile,
// // //               child: const Text('Select Image'),
// // //             ),
// // //             SizedBox(height: 20),
// // //             if (_selectedFile != null)
// // //               Image.memory(
// // //                 _imageBytes!,
// // //                 width: 200,
// // //                 height: 200,
// // //               ),
// // //             SizedBox(height: 20),
// // //             ElevatedButton(
// // //               onPressed: _uploadImage,
// // //               child: const Text('Upload Image'),
// // //             ),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }
// // //
// // //
// // //
// // //
// // //
// // //
// // //
// // //
// // //
// // //
// // //
// // //
// // //
// // // class NewItemPage extends StatefulWidget {
// // //   @override
// // //   State<NewItemPage> createState() => _NewItemPageState();
// // // }
// // //
// // // class _NewItemPageState extends State<NewItemPage> {
// // //   String defaultImageUrl =
// // //       'https://cdn.pixabay.com/photo/2016/03/23/15/00/ice-cream-1274894_1280.jpg';
// // //   String selectedFile = '';
// // //   late XFile file;
// // //   Uint8List? selectedImageInBytes;
// // //   List<Uint8List> pickedImagesInBytes = [];
// // //   List<String> imageUrls = [];
// // //   int imageCounts = 0;
// // //   TextEditingController _itemNameController = TextEditingController();
// // //   TextEditingController _itemPriceController = TextEditingController();
// // //   TextEditingController _deviceTokenController = TextEditingController();
// // //   bool isItemSaved = false;
// // //
// // //   @override
// // //   void initState() {
// // //     _selectFile(true);
// // //     super.initState();
// // //   }
// // //
// // //   @override
// // //   void dispose() {
// // //     _itemNameController.dispose();
// // //     _itemPriceController.dispose();
// // //     super.dispose();
// // //   }
// // //
// // //   //This modal shows image selection either from gallery or camera
// // //   void _showPicker(BuildContext context) {
// // //     showModalBottomSheet(
// // //       //backgroundColor: Colors.transparent,
// // //       context: context,
// // //       builder: (BuildContext bc) {
// // //         return SafeArea(
// // //           child: Container(
// // //             height: MediaQuery.of(context).size.height * 0.15,
// // //             decoration: const BoxDecoration(
// // //               borderRadius: BorderRadius.only(
// // //                 topLeft: Radius.circular(25),
// // //                 topRight: Radius.circular(25),
// // //               ),
// // //             ),
// // //             child: Wrap(
// // //               children: <Widget>[
// // //                 SizedBox(
// // //                   height: 10,
// // //                 ),
// // //                 ListTile(
// // //                     leading: const Icon(
// // //                       Icons.photo_library,
// // //                     ),
// // //                     title: const Text(
// // //                       'Gallery',
// // //                       style: TextStyle(),
// // //                     ),
// // //                     onTap: () {
// // //                       _selectFile(true);
// // //                       Navigator.of(context).pop();
// // //                     }),
// // //                 ListTile(
// // //                   leading: const Icon(
// // //                     Icons.photo_camera,
// // //                   ),
// // //                   title: const Text(
// // //                     'Camera',
// // //                     style: TextStyle(),
// // //                   ),
// // //                   onTap: () {
// // //                     _selectFile(true);
// // //                     Navigator.of(context).pop();
// // //                   },
// // //                 ),
// // //               ],
// // //             ),
// // //           ),
// // //         );
// // //       },
// // //     );
// // //   }
// // //
// // //   _selectFile(bool imageFrom) async {
// // //     FilePickerResult? fileResult = await FilePicker.platform.pickFiles(allowMultiple: true);
// // //
// // //     if (fileResult != null) {
// // //       selectedFile = fileResult.files.first.name;
// // //       selectedImageInBytes = fileResult.files.first.bytes;
// // //
// // //       // fileResult.files.forEach((element) {
// // //       //   setState(() {
// // //       //     // pickedImagesInBytes.add(element.bytes);
// // //       //     selectedImageInBytes = fileResult.files.first.bytes;
// // //       //     imageCounts += 1;
// // //       //   });
// // //       // });
// // //     }
// // //     print(selectedFile);
// // //   }
// // //   //
// // //   // Future<String> _uploadFile() async {
// // //   //   String imageUrl = '';
// // //   //   try {
// // //   //     firabase_storage.UploadTask uploadTask;
// // //   //
// // //   //     firabase_storage.Reference ref = firabase_storage.FirebaseStorage.instance
// // //   //         .ref()
// // //   //         .child('product')
// // //   //         .child('/' + selectedFile);
// // //   //
// // //   //     final metadata = firabase_storage.SettableMetadata(
// // //   //         contentType: 'image/jpeg');
// // //   //
// // //   //     //uploadTask = ref.putFile(File(file.path));
// // //   //     uploadTask = ref.putData(selectedImageInBytes, metadata);
// // //   //
// // //   //     await uploadTask.whenComplete(() => null);
// // //   //     imageUrl = await ref.getDownloadURL();
// // //   //   } catch (e) {
// // //   //     print(e);
// // //   //   }
// // //   //   return imageUrl;
// // //   // }
// // //
// // //   // Future<String> _uploadMultipleFiles(String itemName) async {
// // //   //   String imageUrl = '';
// // //   //   try {
// // //   //     for (var i = 0; i < imageCounts; i++) {
// // //   //       firabase_storage.UploadTask uploadTask;
// // //   //
// // //   //       firabase_storage.Reference ref = firabase_storage
// // //   //           .FirebaseStorage.instance
// // //   //           .ref()
// // //   //           .child('product')
// // //   //           .child('/' + itemName + '_' + i.toString());
// // //   //
// // //   //       final metadata =
// // //   //       firabase_storage.SettableMetadata(contentType: 'image/jpeg');
// // //   //
// // //   //       //uploadTask = ref.putFile(File(file.path));
// // //   //       uploadTask = ref.putData(pickedImagesInBytes[i], metadata);
// // //   //
// // //   //       await uploadTask.whenComplete(() => null);
// // //   //       imageUrl = await ref.getDownloadURL();
// // //   //       setState(() {
// // //   //         imageUrls.add(imageUrl);
// // //   //       });
// // //   //     }
// // //   //   } catch (e) {
// // //   //     print(e);
// // //   //   }
// // //   //   return imageUrl;
// // //   // }
// // //
// // //   // saveItem() async {
// // //   //   setState(() {
// // //   //     isItemSaved = true;
// // //   //   });
// // //   //   //String imageUrl = await _uploadFile();
// // //   //   await _uploadMultipleFiles(_itemNameController.text);
// // //   //   print('Uploaded Image URL ' + imageUrls.length.toString());
// // //   //   await FirebaseFirestore.instance.collection('vegetables').add({
// // //   //     'itemName': _itemNameController.text,
// // //   //     'itemPrice': _itemPriceController.text,
// // //   //     'itemImageUrl': imageUrls,
// // //   //     'createdOn': DateTime.now().toIso8601String(),
// // //   //   }).then((value) {
// // //   //     setState(() {
// // //   //       isItemSaved = false;
// // //   //     });
// // //   //     // Navigator.of(context)
// // //   //     //     .push(MaterialPageRoute(builder: ((context) => ItemListPage())));
// // //   //   });
// // //   // }
// // //
// // //   String constructFCMPayload(String token) {
// // //     return jsonEncode({
// // //       'to': token,
// // //       'data': {
// // //         'via': 'FlutterFire Cloud Messaging!!!',
// // //       },
// // //       'notification': {
// // //         'title':
// // //         'Your item  ${_itemNameController.text} is added successfully !',
// // //         'body': 'Please subscribe, like and share this tutorial !',
// // //       },
// // //     });
// // //   }
// // //   //
// // //   // Future<void> sendPushMessage() async {
// // //   //   if (_deviceTokenController.text == null) {
// // //   //     print('Unable to send FCM message, no token exists.');
// // //   //     return;
// // //   //   }
// // //
// // //   //   try {
// // //   //     String serverKey =
// // //   //         "AAAA0RJf2UE:APA91bE_M-axKmqqoV5EinizvWP4T9bOkmCXAwU8JPFCEQsVCZXBdgsX2Nq_coDtvo49ULywfLtzorKS0TlB-1LxNQhFZRBrbk6hcoD0fgHy-i3ed0ehx7yDaHxYLzjXAt7vO2XDMIBD";
// // //   //     await http.post(
// // //   //       Uri.parse('https://fcm.googleapis.com/fcm/send'),
// // //   //       headers: <String, String>{
// // //   //         'Content-Type': 'application/json; charset=UTF-8',
// // //   //         'Authorization': 'key=$serverKey'
// // //   //       },
// // //   //       body: constructFCMPayload(_deviceTokenController.text),
// // //   //     );
// // //   //     print('FCM request for device sent!');
// // //   //   } catch (e) {
// // //   //     print(e);
// // //   //   }
// // //   // }
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         title: Text(
// // //           'Vegetable Seller',
// // //         ),
// // //       ),
// // //       body: SingleChildScrollView(
// // //         child: Center(
// // //           child: Column(
// // //             mainAxisAlignment: MainAxisAlignment.center,
// // //             crossAxisAlignment: CrossAxisAlignment.center,
// // //             children: [
// // //               SizedBox(
// // //                 height: MediaQuery.of(context).size.height * 0.02,
// // //               ),
// // //               Container(
// // //                   height: MediaQuery.of(context).size.height * 0.35,
// // //                   width: MediaQuery.of(context).size.width * 0.3,
// // //                   decoration: BoxDecoration(
// // //                     borderRadius: BorderRadius.circular(
// // //                       15,
// // //                     ),
// // //                   ),
// // //                   child: selectedFile.isEmpty
// // //                       ? Image.network(
// // //                     defaultImageUrl,
// // //                     fit: BoxFit.cover,
// // //                   )
// // //                   // Image.asset('assets/create_menu_default.png')
// // //                       : Image.memory(selectedImageInBytes!),
// // //
// // //                 // Image.file(
// // //                 //     File(file.path),
// // //                 //     fit: BoxFit.fill,
// // //                 //   ),
// // //               ),
// // //               SizedBox(
// // //                 height: MediaQuery.of(context).size.height * 0.02,
// // //               ),
// // //               SizedBox(
// // //                 height: MediaQuery.of(context).size.height * 0.05,
// // //                 child: ElevatedButton.icon(
// // //                   onPressed: () {
// // //                     //_showPicker(context);
// // //                     _selectFile(true);
// // //                   },
// // //                   icon: const Icon(
// // //                     Icons.camera,
// // //                   ),
// // //                   label: const Text(
// // //                     'Pick Image',
// // //                     style: TextStyle(),
// // //                   ),
// // //                 ),
// // //               ),
// // //               SizedBox(
// // //                 height: MediaQuery.of(context).size.height * 0.02,
// // //               ),
// // //               if (isItemSaved)
// // //                 Container(
// // //                   child: CircularProgressIndicator(
// // //                     color: Colors.green,
// // //                   ),
// // //                 ),
// // //               Container(
// // //                 height: MediaQuery.of(context).size.height * 0.1,
// // //                 width: MediaQuery.of(context).size.width * 0.3,
// // //                 decoration: BoxDecoration(
// // //                   borderRadius: BorderRadius.circular(
// // //                     25,
// // //                   ),
// // //                 ),
// // //                 child: TextField(
// // //                   cursorColor: Colors.black,
// // //                   decoration: InputDecoration(
// // //                     hintStyle: TextStyle(
// // //                       color: Colors.black,
// // //                     ),
// // //                     border: new OutlineInputBorder(
// // //                       borderRadius: BorderRadius.circular(
// // //                         15,
// // //                       ),
// // //                       borderSide: new BorderSide(
// // //                         color: Colors.black,
// // //                         width: 1,
// // //                       ),
// // //                     ),
// // //                     focusedBorder: OutlineInputBorder(
// // //                       borderSide: new BorderSide(
// // //                         color: Colors.black,
// // //                         width: 1,
// // //                       ),
// // //                     ),
// // //                     labelText: 'Item Name',
// // //                     labelStyle: TextStyle(
// // //                       color: Colors.black,
// // //                     ),
// // //                   ),
// // //                   controller: _itemNameController,
// // //                   style: TextStyle(
// // //                     color: Colors.black,
// // //                   ),
// // //                 ),
// // //               ),
// // //               SizedBox(
// // //                 height: MediaQuery.of(context).size.height * 0.02,
// // //               ),
// // //               Container(
// // //                 height: MediaQuery.of(context).size.height * 0.1,
// // //                 width: MediaQuery.of(context).size.width * 0.3,
// // //                 decoration: BoxDecoration(
// // //                   borderRadius: BorderRadius.circular(
// // //                     25,
// // //                   ),
// // //                 ),
// // //                 child: TextField(
// // //                   cursorColor: Colors.black,
// // //                   decoration: InputDecoration(
// // //                     hintStyle: TextStyle(
// // //                       color: Colors.black,
// // //                     ),
// // //                     border: new OutlineInputBorder(
// // //                       borderRadius: BorderRadius.circular(
// // //                         15,
// // //                       ),
// // //                       borderSide: new BorderSide(
// // //                         color: Colors.black,
// // //                         width: 1,
// // //                       ),
// // //                     ),
// // //                     focusedBorder: OutlineInputBorder(
// // //                       borderSide: new BorderSide(
// // //                         color: Colors.black,
// // //                         width: 1,
// // //                       ),
// // //                     ),
// // //                     labelText: 'Item Price',
// // //                     labelStyle: TextStyle(
// // //                       color: Colors.black,
// // //                     ),
// // //                   ),
// // //                   controller: _itemPriceController,
// // //                   style: TextStyle(
// // //                     color: Colors.black,
// // //                   ),
// // //                 ),
// // //               ),
// // //               SizedBox(
// // //                 height: MediaQuery.of(context).size.height * 0.02,
// // //               ),
// // //             ],
// // //           ),
// // //         ),
// // //       ),
// // //       floatingActionButton: Container(
// // //         width: MediaQuery.of(context).size.width * 0.08,
// // //         margin: EdgeInsets.only(
// // //           bottom: MediaQuery.of(context).size.height * 0.02,
// // //         ),
// // //         decoration: BoxDecoration(
// // //           color: Colors.green,
// // //           borderRadius: BorderRadius.circular(
// // //             25,
// // //           ),
// // //           // border: Border.all(
// // //           //   width: 1,
// // //           //   //color: Colors.black,
// // //           // ),
// // //         ),
// // //         child: TextButton(
// // //           onPressed: () {
// // //             //saveItem();
// // //           },
// // //           child: Text(
// // //             'Save',
// // //             style: TextStyle(
// // //               fontSize: 18,
// // //               color: Colors.white,
// // //             ),
// // //           ),
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }
// // //
// // //
// // //
// //
// //
// //
// //
// // import 'dart:html';
// //
// // import 'package:firebase_core/firebase_core.dart';
// // import 'package:firebase_storage/firebase_storage.dart';
// // import 'package:flutter/cupertino.dart';
// // import 'package:flutter/material.dart';

class Homes extends StatefulWidget {
  @override
  _HomesState createState() => _HomesState();
}

class _HomesState extends State<Homes> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
   String? imgUrl;
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
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text("Something Went wrong"),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return Scaffold(
              body: Column(
                children: [
                  imgUrl == null
                      ? Placeholder(
                    fallbackHeight: 200,
                    fallbackWidth: 400,
                  )
                      : Container(
                    height: 300,
                    width: 300,
                    child: Image.network(
                      imgUrl!,
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  TextButton(
                    onPressed: () => uploadToStorage(),
                    // color: Colors.red,
                    child: Text("Upload"),
                  ),
                ],
              ));
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
// //=====================================================================================
//
//
//
//
//
// import 'dart:html';
// import 'package:provider/provider.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:googleapis/connectors/v1.dart';
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return StreamProvider<CurrentUser>(
//       create: (context) => userStream(),
//       child: MaterialApp(
//         title: 'Flutter Demo',
//         theme: ThemeData(
//           primarySwatch: Colors.blue,
//           visualDensity: VisualDensity.adaptivePlatformDensity,
//         ),
//         home: ProfilePage(),
//       ),
//     );
//   }
// }
//
// class ProfilePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final _currentUser = Provider.of<CurrentUser>(context);
//     if (_currentUser == null) return Center(child: CircularProgressIndicator());
//     return Scaffold(
//       body: Center(
//         child: Column(
//           children: [
//             SizedBox(height: 100),
//             ProfilePicture(),
//             SizedBox(height: 20),
//             OutlineButton(
//               onPressed: () {
//                 uploadToStorage(_currentUser);
//               },
//               child: Text('Update Profile Picture'),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class ProfilePicture extends StatelessWidget {
//   const ProfilePicture({
//     Key key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final _currentUser = Provider.of<CurrentUser>(context);
//     if (_currentUser == null) return Center(child: CircularProgressIndicator());
//
//     return StreamBuilder<Uri>(
//       stream: downloadUrl(_currentUser.photoUrl).asStream(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Center(child: CircularProgressIndicator());
//         }
//
//         return CircleAvatar(
//           radius: 48,
//           child: Image.network(snapshot.data.toString()),
//         );
//       },
//     );
//     // return CircleAvatar(
//     //   radius: 48,
//     //   child: Icon(
//     //     Icons.people_alt_rounded,
//     //   ),
//     // );
//   }
// }
//
// Stream<CurrentUser> userStream() {
//   return FirebaseFirestore.instance
//       .collection('users')
//       .doc('JtcAlXoD8DVWduTeqS2F')
//       .snapshots()
//       .map((doc) => CurrentUser.fromDoc(doc));
// }
//
// Future<Uri> downloadUrl(String photoUrl) {
//   return fb
//       .storage()
//       .refFromURL('gs://happy-haris-play.appspot.com/')
//       .child(photoUrl)
//       .getDownloadURL();
// }
//
// void uploadImage({@required Function(File file) onSelected}) {
//   InputElement uploadInput = FileUploadInputElement()..accept = 'image/*';
//   uploadInput.click();
//
//   uploadInput.onChange.listen((event) {
//     final file = uploadInput.files.first;
//     final reader = FileReader();
//     reader.readAsDataUrl(file);
//     reader.onLoadEnd.listen((event) {
//       onSelected(file);
//     });
//   });
// }
//
// void uploadToStorage(CurrentUser user) {
//   final dateTime = DateTime.now();
//   final userId = user.id;
//   final path = '$userId/$dateTime';
//   uploadImage(
//     onSelected: (file) {
//       fb.storage()
//           .refFromURL('gs://happy-haris-play.appspot.com/')
//           .child(path)
//           .put(file)
//           .future
//           .then((_) {
//         FirebaseFirestore.instance
//             .collection('users')
//             .doc(user.id)
//             .update({'photo_url': path});
//       });
//     },
//   );
// }