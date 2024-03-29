import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InformationPage extends StatefulWidget {
  final String? msg;
       const InformationPage({Key? key, this.msg}) : super(key: key);

  @override
  State<InformationPage> createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  List<String> notifications = [];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Purchase Notifications'),
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: IconButton(onPressed: (){}, icon: Text(notifications[index]),),
            trailing:IconButton(onPressed: (){}, icon: Icon(Icons.delete)),
            // You can add additional details or actions related to the purchase notification here
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Simulate adding a new purchase notification
          setState(() {
            notifications.add('New Purchase & Zoom link');
          });
        },
        child: const Icon(Icons.add),
      ),


    );
  }
}
