import 'package:demo_project/Screen/PayMentSystem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ModiulesPage extends StatelessWidget {
  final String? img;
  final String? msg;
  final String? Ps1;
  final String? Ps2;
  final String? Ps3;
  final String? Ps4;
  final String? Ps5;
  final String? Ps;
  ModiulesPage({ this.msg,  this.img,  this.Ps, this.Ps1, this.Ps2, this.Ps3, this.Ps4, this.Ps5});

  MySnackBar(message, context) {
    return ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  MyAlertDialog(context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Expanded(
              child: AlertDialog(
            title: Text("Alert !"),
            content: Text("Do you want?"),
            actions: [
              TextButton(
                  onPressed: () {




                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PayMentSystem()));
                    //Navigator.of(context).pop();
                  },
                  child: Text("Yes")),
              TextButton(
                  onPressed: () {
                    MySnackBar("Thanks", context);
                    Navigator.of(context).pop();
                  },
                  child: Text("No")),
            ],
          ));
        });
  }

  ButtonStyle buttonStyle = ElevatedButton.styleFrom(
      padding: EdgeInsets.all(20),
      backgroundColor: Colors.green,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))));
  ButtonStyle buttonStyles = ElevatedButton.styleFrom(
    padding: const EdgeInsets.symmetric(vertical: 25.2, horizontal: 80.5),
    backgroundColor: Colors.white,
    foregroundColor: Colors.black,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
      side: const BorderSide(
        color: Color(0xFF000000),
      ), // Border color
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          'Class Modules',
          style: GoogleFonts.arbutusSlab(
            textStyle: TextStyle(
              color: Colors.black87,
              fontSize: 15,
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment:CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                width: 200,
                height: 200,
                child: Image(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                      '$img',
                    )),
              ),
              SizedBox(height: 5),
              Text("$msg",
                style: GoogleFonts.arbutusSlab(
                  textStyle: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Colors.black87,
                    fontSize: 15,
                  ),
                ),
              ),
              Text(
                "$Ps1",
                style: GoogleFonts.arbutusSlab(
                  textStyle: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Colors.black87,
                    fontSize: 15,
                  ),
                ),
              ),
              Text(
                "$Ps2",
                style: GoogleFonts.arbutusSlab(
                  textStyle: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Colors.black87,
                    fontSize: 15,
                  ),
                ),
              ),
              Text(
                "$Ps3",
                style: GoogleFonts.arbutusSlab(
                  textStyle: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Colors.black87,
                    fontSize: 15,
                  ),
                ),
              ),
              Text(
                "$Ps4",
                style: GoogleFonts.arbutusSlab(
                  textStyle: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Colors.black87,
                    fontSize: 15,
                  ),
                ),
              ),
              Text(
                " =>$Ps5",
                style: GoogleFonts.arbutusSlab(
                  textStyle: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Colors.black87,
                    fontSize: 15,
                  ),
                ),
              ),
              Text(
                "$Ps",
                style: GoogleFonts.arbutusSlab(
                  textStyle: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Colors.black87,
                    fontSize: 15,
                  ),
                ),
              ),
SizedBox(height: 10,),
              Center(
                  child: OutlinedButton(
                      onPressed: () {
                        MyAlertDialog(context);

                      },
                      child: Text('Enroll Now'),
                      style: buttonStyles)),
              SizedBox(height: 5,),
              Center(
                child: Text(
                  "500/-tk",
                  style: GoogleFonts.arbutusSlab(
                    textStyle: TextStyle(
                      fontStyle: FontStyle.italic,
                      color: Colors.purpleAccent,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
