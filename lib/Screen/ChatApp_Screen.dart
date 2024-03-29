// // Define Message model
// class Message {
//   String senderId;
//   String receiverId;
//   String messageContent;
//   DateTime timestamp;
//
//   Message({
//     required this.senderId,
//     required this.receiverId,
//     required this.messageContent,
//     required this.timestamp,
//   });
// }
//
// // Firebase Firestore service
// class FirestoreService {
//   // Methods to interact with Firestore
// }
//
// // Chat Screen Widget
// class ChatScreen extends StatefulWidget {
//   final String userId;
//
//   ChatScreen({required this.userId});
//
//   @override
//   _ChatScreenState createState() => _ChatScreenState();
// }
//
// class _ChatScreenState extends State<ChatScreen> {
//   List<Message> messages = [];
//
//   @override
//   void initState() {
//     super.initState();
//     // Listen to changes in Firestore messages collection
//     // Update messages list when new messages are added
//   }
//
//   void sendMessage(String messageContent) {
//     // Send message to Firestore
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Chat'),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               itemCount: messages.length,
//               itemBuilder: (context, index) {
//                 Message message = messages[index];
//                 // Return a widget to display the message
//               },
//             ),
//           ),
//           // Text input and send button
//         ],
//       ),
//     );
//   }
// }
//
// // Authentication Screen Widget
// class AuthenticationScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Sign In'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             // Perform sign in
//           },
//           child: Text('Sign In'),
//         ),
//       ),
//     );
//   }
// }
  //-----------------------------------0------------------------
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class ChatScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Simple Chat'),
//       ),
//       body: ChatBody(),
//     );
//   }
// }
//
// class ChatBody extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder(
//       stream: FirebaseFirestore.instance.collection('messages').snapshots(),
//       builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
//         if (!snapshot.hasData) {
//           return CircularProgressIndicator();
//         }
//         return ListView(
//           children: snapshot.data!.docs.map((DocumentSnapshot document) {
//             Map<String, dynamic> data = document.data() as Map<String, dynamic>;
//             return ListTile(
//               title: Text(data['content']),
//               subtitle: Text(data['sender']),
//             );
//           }).toList(),
//         );
//       },
//     );
//   }
// }
// //---------------------------------------------0---------------------
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController _controller = TextEditingController();
  List<String> _messages = [];

  void _sendMessage() {
    String message = _controller.text.trim();
    if (message.isNotEmpty) {
      setState(() {
        _messages.add(message);
      });
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Chat'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_messages[index]),
                  subtitle: Text('Sender: Me'),
                  // You can display sender/receiver dynamically based on your implementation
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Enter your message...',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}