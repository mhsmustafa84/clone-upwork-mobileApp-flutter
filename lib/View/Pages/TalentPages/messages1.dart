import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:upwork/Models/message.dart';
import 'package:upwork/Services/authService.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatScreen extends StatefulWidget {
  final AuthService auth;
  final VoidCallback signedOut;
  ChatScreen({
    this.auth,
    this.signedOut,
  });
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController messageController = TextEditingController();
  ScrollController scrollController = ScrollController();

  String userName = '';
  @override
  void initState() {
    super.initState();
    setState(() {
      String email = auth.currentUser.email;
      final String userEmail = email;
      final endIndex = userEmail.indexOf("@");
      userName = userEmail.substring(0, endIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Messages",
          style: TextStyle(
              fontSize: 35,
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontFamily: 'Spartan',
              letterSpacing: 1.5),
        ),
        backgroundColor: Colors.white,
        // actions: <Widget>[
        //   IconButton(
        //       icon: FaIcon(FontAwesomeIcons.signOutAlt),
        //       color: Colors.black,
        //       onPressed: logOut),
        // ],
      ),
      backgroundColor: Color(0xffebeef3),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              //margin: EdgeInsets.symmetric(horizontal: 5),
              child: StreamBuilder<QuerySnapshot>(
                  stream: _firestore
                      .collection("messagess")
                      .orderBy(
                        "timestamp",
                      )
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData)
                      return Center(
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.blue,
                        ),
                      );
                    List<DocumentSnapshot> docs = snapshot.data.docs;

                    List<Widget> messagess = docs
                        .map((doc) => Message(
                              user: doc.data()['user'] ?? '',
                              text: doc.data()['text'] ?? '',
                              timestamp: doc.data()['timestamp'] ?? '',
                              mine: userName == doc.data()['user'] ?? '',
                            ))
                        .toList();
                    return ListView(
                      controller: scrollController,
                      children: messagess,
                    );
                  }),
            ),
          ),
          Container(
            color: Colors.white,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextField(
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 15,
                      ),
                      onSubmitted: (value) => sendChat(),
                      controller: messageController,
                      cursorColor: Color(0xff7d7cda),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        filled: true,
                        fillColor: Color(0xffebeef3),
                        hintText: "Type a message",
                        hintStyle:
                            TextStyle(fontFamily: 'Montserrat', fontSize: 12),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: FaIcon(
                    FontAwesomeIcons.paperPlane,
                    color: Colors.black,
                  ),
                  onPressed: sendChat,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void logOut() async {
    try {
      await widget.auth.signOut();
      widget.signedOut();
    } catch (e) {
      print("error :" + e.toString());
    }
  }

  Future<void> sendChat() async {
    if (messageController.text.length > 0) {
      await _firestore.collection("messagess").add({
        'user': userName,
        'text': messageController.text,
        'timestamp': FieldValue.serverTimestamp(),
      });
      messageController.clear();
      scrollController.animateTo(scrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 300), curve: Curves.easeOut);
    }
  }
}
