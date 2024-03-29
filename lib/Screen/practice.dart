//
//
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
//
// import 'Modiules.dart';
//
// /
// // class list extends StatefulWidget {
// //   const list({Key? key}) : super(key: key);
// //
// //   @override
// //   State<list> createState() => _listState();
// // }
// //
// // class _listState extends State<list> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: GridView.builder(
// //         itemCount:_data.length,// Number of items in the list
// //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
// //           crossAxisCount: 2, // Number of columns
// //           childAspectRatio: 1.0, // Aspect ratio for square cells
// //         ),
// //         itemBuilder: (BuildContext context, int index) {
// //           return GridTile(
// //             child: Container(
// //               child: ListTile(
// //                 title: Text(
// //                   '${_data[index]['title']}',
// //                   style: GoogleFonts.arbutusSlab(
// //                     textStyle: TextStyle(
// //                       color: Colors.black87,
// //                       fontSize: 15,
// //                     ),
// //                   ),
// //                 ),
// //                 subtitle: Text(
// //                   "${_data[index]['Price']}",
// //                   style: GoogleFonts.arbutusSlab(
// //                     textStyle: const TextStyle(
// //                       fontStyle: FontStyle.italic,
// //                       color: Colors.black87,
// //                       fontSize: 15,
// //                     ),
// //                   ),
// //                 ),
// //                 leading: CircleAvatar(
// //                   radius: 30,
// //                   backgroundImage:
// //                   NetworkImage('${_data[index]['image']}'),
// //                 ),
// //                 onTap: () {
// //                   Navigator.push(
// //                     context,
// //                     MaterialPageRoute(
// //                       builder: (context) =>
// //                           ModiulesPage(
// //                             msg: _data[index]['title'],
// //                             img: _data[index]['image'],
// //                             Ps: _data[index]['Price'],
// //                           ),
// //                     ),
// //                   );
// //                 },
// //               ),
// //             ),
// //
// //
// //           );
// //         }
// //     ),
// //     );
// //   }
// // }
// class list extends StatefulWidget {
//   const list({Key? key}) : super(key: key);
//
//   @override
//   State<list> createState() => _listState();
// }
//
// class _listState extends State<list> {
//   TextEditingController _searchController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(30.0),
//               child: TextField(
//                 style: TextStyle(
//                   color: Colors.black,
//                 ),
//                 textAlign: TextAlign.center,
//                controller: _searchController,
//                 decoration: InputDecoration(
//                   fillColor: Colors.black45,
//                   hintText: 'Search...',
//                   suffixIcon: IconButton(
//                     icon: Icon(Icons.clear),
//                     onPressed: () {
//                       _searchController.clear();
//                       setState(() {});
//                     },
//                   ),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(20.0),
//                   ),
//                 ),
//                 onChanged: (_) => setState(() {}),
//               ),
//             ),
//               //SizedBox(height: 10),
//
//
//             Expanded(
//               child: Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: GridView.builder(
//                     itemCount:_data.length,// Number of items in the list
//                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 2, // Number of columns
//                       childAspectRatio: 3.0, // Aspect ratio for square cells
//                     ),
//                     itemBuilder: (BuildContext context, int index) {
//                       final item = _data[index];
//                       final title = item['title'].toString().toLowerCase();
//                       final query = _searchController.text.toLowerCase();
//                       if (query.isNotEmpty && !title.contains(query)) {
//                         return Container(); // Don't show if not matching search
//                       }
//
//                       return GridTile(
//                         child: Container(
//                           height: 40,
//                           width: 20,
//                           decoration: BoxDecoration(
//                            // borderRadius: BorderRadius.zero,
//                             border: Border.all(color: Colors.black,),
//                           ),
//                           child: GestureDetector(
//                             onTap: (){
//                               Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) =>
//                                     ModiulesPage(
//                                       msg: _data[index]['title'],
//                                       img: _data[index]['image'],
//                                       Ps: _data[index]['Price'],
//                                     ),
//                               ),
//                             );
//                             },
//                             child: Container(
//                               width: double.infinity,
//                                 height: 220,
//                                 child: Image.network('${_data[index]['image']}',
//                                 fit:BoxFit.fill,
//                                 ),
//                             ),
//                           ),
//                         ),
//
//
//                       );
//                     }
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
//
//
// // class SquareList extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return
// //   }
// // }
//
//
// List<Map<String, dynamic>> _data = [
//   {
//     "image":"assets/images/Class2.jpg",
//     "title": "সংক্ষিপ্ত পদ্ধতিতে গড় নির্ণয় ",
//     "Price": "মধ্যক নির্ণয়"
//   },
//   {
//     "image": "assets/images/Class3.jpg",
//     "title": "Orange",
//     "Price": "500gm  100 Taka",
//   },
//   {
//     "image":"assets/images/class4.jpg",
//     "title": "Pomegranate",
//     "Price": "500gm  120 Taka",
//   },
//   {
//     "image":"assets/images/Quiz.jpg",
//     "title": "Straberry",
//     "Price": "500gm  110 Taka",
//   },
//
//
// ];
