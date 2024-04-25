import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_project/Screen/profile_Page.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  // text fiedl controller
  // final TextEditingController _nameController = TextEditingController();
  // final TextEditingController _numberController = TextEditingController();
  //
  // final CollectionReference _items = FirebaseFirestore.instance.collection("Upload_Items");
  // // collection name must be same as firebase collection name
  //
  //
  // String imageUrl = '';
  // File? PickImage;
  // Uint8List webImage =Uint8List(8);
  //
  // Future<void> _create([DocumentSnapshot? documentSnapshot]) async {
  //   await showModalBottomSheet(
  //       isScrollControlled: true,
  //       context: context,
  //       builder: (BuildContext ctx) {
  //         return Padding(
  //           padding: EdgeInsets.only(
  //               top: 20,
  //               right: 20,
  //               left: 20,
  //               bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
  //           child: Column(
  //             mainAxisSize: MainAxisSize.min,
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               const Center(
  //                 child: Text("Create your Items"),
  //               ),
  //               TextField(
  //                 controller: _nameController,
  //                 decoration: const InputDecoration(
  //                     labelText: 'Name', hintText: 'eg Elon'),
  //               ),
  //               TextField(
  //                 controller: _numberController,
  //                 decoration: const InputDecoration(
  //                     labelText: 'Number', hintText: 'eg 10'),
  //               ),
  //               const SizedBox(
  //                 height: 10,
  //               ),
  //
  //
  //               InkWell(
  //                 onTap: () async {
  //                   // pickImage();
  //
  //                 },
  //                 child: Row(
  //                   children: [
  //                     Container(
  //                       padding: const EdgeInsets.all(16),
  //                       decoration: const BoxDecoration(
  //                           color: Colors.grey,
  //                           borderRadius: BorderRadius.only(
  //                             topLeft: Radius.circular(8),
  //                             bottomLeft: Radius.circular(8),
  //                           )),
  //                       child: const Text('Photo'),
  //                     ),
  //                     Expanded(
  //                       child: Container(
  //                         padding: const EdgeInsets.all(16),
  //                         decoration: const BoxDecoration(
  //                             color: Colors.white,
  //                             borderRadius: BorderRadius.only(
  //                               topRight: Radius.circular(8),
  //                               bottomRight: Radius.circular(8),
  //                             )),
  //                         child:PickImage != null
  //                             ? Text('image selected.')
  //                             : Text('No image selected.'),
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //
  //               const SizedBox(
  //                 height: 10,
  //               ),
  //
  //               Center(
  //                   child: IconButton(
  //                       onPressed: () async {
  //                         // add the package image_picker for web
  //                         // final file = await ImagePicker().pickImage(source: ImageSource.gallery);
  //                         // if (file != null) {
  //                         //   setState(() {});
  //                         //   print(file?.path);
  //                         //
  //                         // }
  //                         // if (file == null)
  //                         //   return;
  //                         //======================================
  //
  //                         if (!kIsWeb) {
  //                           final ImagePicker _picker = ImagePicker();
  //                           XFile ? image = await _picker.pickImage(source: ImageSource.gallery);
  //                           if (image != null) {
  //                             var selected = File(image.path);
  //                             print(selected);
  //                             setState(() {
  //                               PickImage = selected;
  //                             });
  //                           } else {
  //                             print('no image');
  //
  //                           }
  //                         }  else if (kIsWeb){
  //                           final ImagePicker _picker = ImagePicker();
  //                           XFile ? image = await _picker.pickImage(source: ImageSource.gallery);
  //
  //                           if (image != null) {
  //                             var f =await image.readAsBytes();
  //
  //                             setState(() {
  //                               webImage =f;
  //                               PickImage = File('a');
  //                             });
  //
  //
  //                           }else {
  //                             print('wrong');
  //                           }
  //                         }
  //
  //
  //                         if (PickImage  == null) {
  //
  //                           print('file null');
  //
  //                           // Handle case when no image is selected
  //                           return;
  //                         }
  //
  //
  //
  //
  //
  //
  //                         String fileName = DateTime.now().microsecondsSinceEpoch.toString();
  //
  //                         // Get the reference to storage root
  //                         // We create the image folder first and insider folder we upload the image
  //                         Reference referenceRoot = FirebaseStorage.instance.ref();
  //                         Reference referenceDireImages = referenceRoot.child('images');
  //
  //                         // we have creata reference for the image to be stored
  //                         Reference referenceImageaToUpload = referenceDireImages.child(fileName);
  //
  //                         // For errors handled and/or success
  //                         try {
  //                           await referenceImageaToUpload.putFile(PickImage!);
  //
  //                           // We have successfully upload the image now
  //                           // make this upload image link in firebase database
  //
  //                           imageUrl = await referenceImageaToUpload.getDownloadURL();
  //                         } catch (error) {
  //                           ScaffoldMessenger.of(context).showSnackBar(
  //                               const SnackBar(
  //                                   content: Text(
  //                                       "fail load the url")));
  //                         }
  //                       },
  //                       icon: const Icon(Icons.camera_alt))
  //               ),
  //
  //
  //
  //
  //
  //               Center(
  //                   child: ElevatedButton(
  //                       onPressed: () async {
  //                         if (imageUrl.isEmpty) {
  //                           ScaffoldMessenger.of(context).showSnackBar(
  //                               const SnackBar(
  //                                   content: Text(
  //                                       "Please select and upload image")));
  //                           return;
  //                         }
  //                         final String name = _nameController.text;
  //                         final int? number = int.tryParse(_numberController.text);
  //                         if (number != null) { await _items.add({
  //                           // Add items in you firebase firestore
  //                           "name": name,
  //                           "number": number,
  //                           "image": imageUrl,
  //                         });
  //                         _nameController.text = '';
  //                         _numberController.text = '';
  //                         Navigator.of(context).pop();
  //                         }
  //                       },
  //                       child: const Text('Submit')))
  //             ],
  //           ),
  //         );
  //       });
  // }

  late Stream<QuerySnapshot> _stream;
  @override
  void initState() {
    super.initState();
    _stream = FirebaseFirestore.instance.collection('Your purches').snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Purchase Notifications"),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: _stream,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text("Some error occured${snapshot.error}"),
              );
            }
            // Now , Cheeck if datea arrived?
            if (snapshot.hasData) {
              QuerySnapshot querySnapshot = snapshot.data;
              List<QueryDocumentSnapshot> document = querySnapshot.docs;

              // We need to Convert your documnets to Maps to display
              List<Map> items = document.map((e) => e.data() as Map).toList();

              //At Last, Display the list of items
              return ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (BuildContext context, int index) {
                    Map thisItems = items[index];
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                            'Your Purchase( Class ${items[index]['ClassName']})',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        ),
                        TextButton(
                            style: const ButtonStyle(),
                            onPressed: () {},
                            child:
                                const Text("Check your Email & Join the Class"))
                      ],
                    );
                  });
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}






// class NotificationPage extends StatefulWidget {
//   const NotificationPage({super.key});
//
//   @override
//   State<NotificationPage> createState() => _NotificationPageState();
// }
//
// class _NotificationPageState extends State<NotificationPage> {
//   // text fiedl controller
//   // final TextEditingController _nameController = TextEditingController();
//   // final TextEditingController _numberController = TextEditingController();
//   //
//   // final CollectionReference _items = FirebaseFirestore.instance.collection("Upload_Items");
//   // // collection name must be same as firebase collection name
//   //
//   //
//   // String imageUrl = '';
//   // File? PickImage;
//   // Uint8List webImage =Uint8List(8);
//   //
//   // Future<void> _create([DocumentSnapshot? documentSnapshot]) async {
//   //   await showModalBottomSheet(
//   //       isScrollControlled: true,
//   //       context: context,
//   //       builder: (BuildContext ctx) {
//   //         return Padding(
//   //           padding: EdgeInsets.only(
//   //               top: 20,
//   //               right: 20,
//   //               left: 20,
//   //               bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
//   //           child: Column(
//   //             mainAxisSize: MainAxisSize.min,
//   //             crossAxisAlignment: CrossAxisAlignment.start,
//   //             children: [
//   //               const Center(
//   //                 child: Text("Create your Items"),
//   //               ),
//   //               TextField(
//   //                 controller: _nameController,
//   //                 decoration: const InputDecoration(
//   //                     labelText: 'Name', hintText: 'eg Elon'),
//   //               ),
//   //               TextField(
//   //                 controller: _numberController,
//   //                 decoration: const InputDecoration(
//   //                     labelText: 'Number', hintText: 'eg 10'),
//   //               ),
//   //               const SizedBox(
//   //                 height: 10,
//   //               ),
//   //
//   //
//   //               InkWell(
//   //                 onTap: () async {
//   //                   // pickImage();
//   //
//   //                 },
//   //                 child: Row(
//   //                   children: [
//   //                     Container(
//   //                       padding: const EdgeInsets.all(16),
//   //                       decoration: const BoxDecoration(
//   //                           color: Colors.grey,
//   //                           borderRadius: BorderRadius.only(
//   //                             topLeft: Radius.circular(8),
//   //                             bottomLeft: Radius.circular(8),
//   //                           )),
//   //                       child: const Text('Photo'),
//   //                     ),
//   //                     Expanded(
//   //                       child: Container(
//   //                         padding: const EdgeInsets.all(16),
//   //                         decoration: const BoxDecoration(
//   //                             color: Colors.white,
//   //                             borderRadius: BorderRadius.only(
//   //                               topRight: Radius.circular(8),
//   //                               bottomRight: Radius.circular(8),
//   //                             )),
//   //                         child:PickImage != null
//   //                             ? Text('image selected.')
//   //                             : Text('No image selected.'),
//   //                       ),
//   //                     ),
//   //                   ],
//   //                 ),
//   //               ),
//   //
//   //               const SizedBox(
//   //                 height: 10,
//   //               ),
//   //
//   //               Center(
//   //                   child: IconButton(
//   //                       onPressed: () async {
//   //                         // add the package image_picker for web
//   //                         // final file = await ImagePicker().pickImage(source: ImageSource.gallery);
//   //                         // if (file != null) {
//   //                         //   setState(() {});
//   //                         //   print(file?.path);
//   //                         //
//   //                         // }
//   //                         // if (file == null)
//   //                         //   return;
//   //                         //======================================
//   //
//   //                         if (!kIsWeb) {
//   //                           final ImagePicker _picker = ImagePicker();
//   //                           XFile ? image = await _picker.pickImage(source: ImageSource.gallery);
//   //                           if (image != null) {
//   //                             var selected = File(image.path);
//   //                             print(selected);
//   //                             setState(() {
//   //                               PickImage = selected;
//   //                             });
//   //                           } else {
//   //                             print('no image');
//   //
//   //                           }
//   //                         }  else if (kIsWeb){
//   //                           final ImagePicker _picker = ImagePicker();
//   //                           XFile ? image = await _picker.pickImage(source: ImageSource.gallery);
//   //
//   //                           if (image != null) {
//   //                             var f =await image.readAsBytes();
//   //
//   //                             setState(() {
//   //                               webImage =f;
//   //                               PickImage = File('a');
//   //                             });
//   //
//   //
//   //                           }else {
//   //                             print('wrong');
//   //                           }
//   //                         }
//   //
//   //
//   //                         if (PickImage  == null) {
//   //
//   //                           print('file null');
//   //
//   //                           // Handle case when no image is selected
//   //                           return;
//   //                         }
//   //
//   //
//   //
//   //
//   //
//   //
//   //                         String fileName = DateTime.now().microsecondsSinceEpoch.toString();
//   //
//   //                         // Get the reference to storage root
//   //                         // We create the image folder first and insider folder we upload the image
//   //                         Reference referenceRoot = FirebaseStorage.instance.ref();
//   //                         Reference referenceDireImages = referenceRoot.child('images');
//   //
//   //                         // we have creata reference for the image to be stored
//   //                         Reference referenceImageaToUpload = referenceDireImages.child(fileName);
//   //
//   //                         // For errors handled and/or success
//   //                         try {
//   //                           await referenceImageaToUpload.putFile(PickImage!);
//   //
//   //                           // We have successfully upload the image now
//   //                           // make this upload image link in firebase database
//   //
//   //                           imageUrl = await referenceImageaToUpload.getDownloadURL();
//   //                         } catch (error) {
//   //                           ScaffoldMessenger.of(context).showSnackBar(
//   //                               const SnackBar(
//   //                                   content: Text(
//   //                                       "fail load the url")));
//   //                         }
//   //                       },
//   //                       icon: const Icon(Icons.camera_alt))
//   //               ),
//   //
//   //
//   //
//   //
//   //
//   //               Center(
//   //                   child: ElevatedButton(
//   //                       onPressed: () async {
//   //                         if (imageUrl.isEmpty) {
//   //                           ScaffoldMessenger.of(context).showSnackBar(
//   //                               const SnackBar(
//   //                                   content: Text(
//   //                                       "Please select and upload image")));
//   //                           return;
//   //                         }
//   //                         final String name = _nameController.text;
//   //                         final int? number = int.tryParse(_numberController.text);
//   //                         if (number != null) { await _items.add({
//   //                           // Add items in you firebase firestore
//   //                           "name": name,
//   //                           "number": number,
//   //                           "image": imageUrl,
//   //                         });
//   //                         _nameController.text = '';
//   //                         _numberController.text = '';
//   //                         Navigator.of(context).pop();
//   //                         }
//   //                       },
//   //                       child: const Text('Submit')))
//   //             ],
//   //           ),
//   //         );
//   //       });
//   // }
//
//   late Stream<QuerySnapshot> _stream;
//   @override
//   void initState() {
//     super.initState();
//     _stream = FirebaseFirestore.instance.collection('Your purches').snapshots();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Purchase Notifications"),
//       ),
//       body: StreamBuilder<QuerySnapshot>(
//           stream: _stream,
//           builder: (BuildContext context, AsyncSnapshot snapshot) {
//             if (snapshot.hasError) {
//               return Center(
//                 child: Text("Some error occured${snapshot.error}"),
//               );
//             }
//             // Now , Cheeck if datea arrived?
//             if (snapshot.hasData) {
//               QuerySnapshot querySnapshot = snapshot.data;
//               List<QueryDocumentSnapshot> document = querySnapshot.docs;
//
//               // We need to Convert your documnets to Maps to display
//               List<Map> items = document.map((e) => e.data() as Map).toList();
//
//               //At Last, Display the list of items
//               return ListView.builder(
//                   itemCount: items.length,
//                   itemBuilder: (BuildContext context, int index) {
//                     Map thisItems = items[index];
//                     return Row(
//                       children: [
//                         Expanded(
//                           flex: 50,
//                           child: Container(
//                             width: double.infinity,
//                             height: 100,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.zero,
//                               border: Border.all(
//                                 color: Colors.black,
//                               ),
//                             ),
//                             child: Image.asset("assets/images/Class2.jpg",
//                                 height: 120, width: 150, fit: BoxFit.fill),
//                           ),
//                         ),
//                         SizedBox(
//                           width: 5,
//                         ),
//                         Expanded(
//                           flex: 50,
//                           child: Container(
//                             width: double.infinity,
//                             height: 100,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.zero,
//                               border: Border.all(
//                                 color: Colors.black,
//                               ),
//                             ),
//                             child: TextButton(
//                               onPressed: () {
//                                 Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                         builder: (context) => ZoomLinkPage()));
//                               },
//                               child: Image.asset("assets/images/zoom.png",
//                                   height: 120, width: 150, fit: BoxFit.scaleDown),
//                             ),
//                           ),
//                         ),
//                       ],
//                     );
//                   });
//             }
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           }),
//     );
//   }
// }
