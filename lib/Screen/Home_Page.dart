import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Notification_Page.dart';
import 'Modiules.dart';

class HomePage1 extends StatefulWidget {
  const HomePage1({Key? key}) : super(key: key);

  @override
  State<HomePage1> createState() => _HomePage1State();
}

class _HomePage1State extends State<HomePage1> {
  TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
                child: Text(
              "WELCOME LEARNERS",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            )),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                height: 200,
                width: 250,
                decoration: BoxDecoration(
                  // borderRadius: BorderRadius.zero,
                  border: Border.all(
                    color: Colors.black,
                  ),
                ),
                child: Center(
                  child: Image.asset(
                    "assets/images/TutorTime.jpg",
                    height: 220,
                    width: 150,
                    fit: BoxFit.scaleDown,
                    //color: Colors.white
                  ),
                ),
              ),
            ),
            const SizedBox(height: 3),
            TextField(
              style: TextStyle(
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
              controller: _searchController,
              decoration: InputDecoration(
                fillColor: Colors.black45,
                hintText: 'Search...',
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    _searchController.clear();
                    setState(() {});
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              onChanged: (_) => setState(() {}),
            ),
            SizedBox(height: 5),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: GridView.builder(
                    itemCount: _data.length, // Number of items in the list
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Number of columns
                      childAspectRatio: 3.0,
                      mainAxisSpacing: 3,
                      crossAxisSpacing: 3, // Aspect ratio for square cells
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      final item = _data[index];
                      final title = item['title'].toString().toLowerCase();
                      final query = _searchController.text.toLowerCase();
                      if (query.isNotEmpty && !title.contains(query)) {
                        return Container(); // Don't show if not matching search
                      }

                      return GridTile(
                        child: Container(
                          height: 40,
                          width: 20,
                          decoration: BoxDecoration(
                            // borderRadius: BorderRadius.zero,
                            border: Border.all(
                              color: Colors.black,
                            ),
                          ),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ModiulesPage(
                                    img: _data[index]['image'],
                                    msg: _data[index]['title'],
                                    Ps1: _data[index]['title1'],
                                    Ps2: _data[index]['title2'],
                                    Ps3: _data[index]['title3'],
                                    Ps4: _data[index]['title4'],
                                    Ps5: _data[index]['title5'],
                                    Ps: _data[index]['Price'],
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              width: double.infinity,
                              height: 220,
                              child: Image.network(
                                '${_data[index]['image']}',
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<Map<String, dynamic>> _data = [
  {
    "image": "assets/images/Class2.jpg",
    "title": "গনিত – পরিসংখ্যান ",
    "title1": "১। সংক্ষিপ্ত পদ্ধতিতে গড় নির্ণয়",
    "title2": "২। মধ্যক নির্ণয়",
    "title3": "৩। প্রচুরক নির্ণয়",
    "title4": "৪। অজীব রেখা নির্ণয়",
    "title5": "Reference Code:420",
    "Price": "Class time – 5.00 pm (24.03.24)"
  },
  {
    "image": "assets/images/class4.jpg",
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
    "image": "assets/images/Quiz.jpg",
    "title": "জীববিজ্ঞান – কোষ বিভাজন  ",
    "title1": "১। মাইটোসিস কোষ বিভাজন",
    "title2": "২। মিয়োসিস কোষ বিভাজন",
    "title3": "৩। নতুন বংশবিস্তার",
    "title4": "৪। DNA অনুলিপণ",
    "title5": "Reference Code:401",
    "Price": "Exam time – 5.00 pm (24.03.24)"
  },



];
