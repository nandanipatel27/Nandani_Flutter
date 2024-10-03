import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Messagescreen extends StatefulWidget {
  final DocumentSnapshot<Object?> userSnapshot;
  Messagescreen({super.key, required this.userSnapshot});

  @override
  State<Messagescreen> createState() => _MessagescreenState();
}

class _MessagescreenState extends State<Messagescreen> {
  TextEditingController _MsgController = TextEditingController();

  @override
  void initState() {
    super.initState();
    print("--r${widget.userSnapshot.id}");
    print("--s${FirebaseAuth.instance.currentUser!.uid}");
  }

  String formatTimestamp(Timestamp timestamp) {
    DateTime dateTime = timestamp.toDate();
    String formattedTime = DateFormat.jm().format(dateTime); //format time
    String formattedDate = DateFormat.yMMMd().format(dateTime); //format date
    return '$formattedDate at $formattedTime'; //combine date and time
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade200,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        elevation: 30,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(widget.userSnapshot["profilePic"]),
            ),
            SizedBox(width: 10),
            Text(
              widget.userSnapshot["name"],
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("messages")
                  .where("receiver", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                  .where("sender", isEqualTo: widget.userSnapshot.id)
                  .orderBy("timestamp")
                  .snapshots(),
              builder: (context, senderSnapshot) {
                if (senderSnapshot.hasError) {
                  return Center(child: Text('Error: ${senderSnapshot.error}'));
                }
                if (!senderSnapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }

                var senderMessages = senderSnapshot.data!.docs;

                return StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("messages")
                      .where("sender", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                      .where("receiver", isEqualTo: widget.userSnapshot.id)
                      .orderBy("timestamp")
                      .snapshots(),
                  builder: (context, receiverSnapshot) {
                    if (receiverSnapshot.hasError) {
                      return Center(child: Text('Error: ${receiverSnapshot.error}'));
                    }
                    if (!receiverSnapshot.hasData) {
                      return Center(child: CircularProgressIndicator());
                    }

                    var receiverMessages = receiverSnapshot.data!.docs;
                    var allMessages = [...senderMessages, ...receiverMessages];

                    allMessages.sort(
                      (a, b) => (a['timestamp'] as Timestamp).compareTo(b['timestamp'] as Timestamp),
                    );

                    return ListView.builder(
                      itemCount: allMessages.length,
                      itemBuilder: (context, index) {
                        var message = allMessages[index];
                        String senderID = message['sender'];
                        bool isCurrentUserIsSender = senderID == FirebaseAuth.instance.currentUser!.uid;

                        return Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: isCurrentUserIsSender ? MainAxisAlignment.end : MainAxisAlignment.start,
                            children: [
                              if (!isCurrentUserIsSender)
                                CircleAvatar(
                                  child: Text("${widget.userSnapshot["name"][0]}"),
                                )
                              else
                                SizedBox(width: 32),
                              SizedBox(width: 8.0),
                              Flexible(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: isCurrentUserIsSender ? Colors.white : Colors.tealAccent,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${message["message"]}",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        formatTimestamp(message["timestamp"] as Timestamp),
                                        style: TextStyle(color: Colors.teal, fontSize: 10),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(12),
            child: Row(
              children: [
                Flexible(
                  child: TextField(
                    controller: _MsgController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      hintText: 'Type message',
                      hintStyle: TextStyle(color: Colors.teal),
                    ),
                    style: TextStyle(color: Colors.amber),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    String messageText = _MsgController.text.toString();
                    if (messageText.isNotEmpty) {
                      FirebaseFirestore.instance.collection("messages").add({
                        "sender": FirebaseAuth.instance.currentUser!.uid,
                        "receiver": widget.userSnapshot.id,
                        "message": messageText,
                        "timestamp": FieldValue.serverTimestamp(), // Use server timestamp
                      });
                      _MsgController.clear();
                    }
                  },
                  icon: Icon(
                    Icons.send,
                    color: Colors.black,
                    size: 26,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
