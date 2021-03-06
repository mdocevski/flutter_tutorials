import 'package:flash_chat/constants.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatefulWidget {
  static const String id = 'chat';

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Firestore _firestore = Firestore.instance;
  final textController = TextEditingController();
  FirebaseUser user;

  String messageText;
  Stream<QuerySnapshot> messageStream;

  void initMessagesStream() async {
    setState(() {
      messageStream = _firestore.collection('messages').snapshots();
    });
  }

  void getCurrentUser() async {
    try {
      final FirebaseUser user = await _auth.currentUser();
      if (user != null) {
        this.user = user;
        initMessagesStream();
      } else {
        Navigator.pop(context);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.close), onPressed: () {}),
        ],
        title: Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Messages(
              messageStream,
              user,
            ),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: textController,
                      onChanged: (value) {
                        //Do something with the user input.
                        messageText = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      textController.clear();
                      _firestore.collection('messages').add({
                        'sender': user.email,
                        'text': messageText,
                      });
                    },
                    child: Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Messages extends StatelessWidget {
  final Stream<QuerySnapshot> messageStream;
  final FirebaseUser user;

  const Messages(this.messageStream, this.user);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: messageStream,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Expanded(
            child: Center(
                child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            )),
          );
        }
        if (snapshot.hasData) {
          return Expanded(
            child: ListView(
              reverse: true,
              padding: EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 20.0,
              ),
              children: snapshot.data.documents.reversed
                  .map((message) => MessageBubble(
                        message: message.data['text'],
                        sender: message.data['sender'],
                        fromSelf: user.email == message.data['sender'],
                      ))
                  .toList(),
            ),
          );
        } else {
          return SizedBox(
            height: 0.0,
            width: 0.0,
          );
        }
      },
    );
  }
}

class MessageBubble extends StatelessWidget {
  final String message, sender;
  final bool fromSelf;

  const MessageBubble({this.message, this.sender, this.fromSelf});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment:
            fromSelf ? CrossAxisAlignment.start : CrossAxisAlignment.end,
        children: <Widget>[
          Text(
            sender,
            style: TextStyle(
              fontSize: 12.0,
            ),
          ),
          Material(
            elevation: 4.0,
            borderRadius: fromSelf
                ? BorderRadius.only(
                    topRight: Radius.circular(12.0),
                    bottomRight: Radius.circular(12.0),
                    bottomLeft: Radius.circular(12.0),
                  )
                : BorderRadius.only(
                    topLeft: Radius.circular(12.0),
                    bottomRight: Radius.circular(12.0),
                    bottomLeft: Radius.circular(12.0),
                  ),
            color: fromSelf ? Colors.grey[300] : Colors.lightBlueAccent,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
                vertical: 16.0,
              ),
              child: Text(
                message,
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
