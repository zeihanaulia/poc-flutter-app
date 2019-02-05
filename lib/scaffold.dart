import 'package:flutter/material.dart';
import 'package:flutter_chat_app/ChatHead.dart';
import 'package:flutter_chat_app/ChatView.dart';

class ChatApp extends StatefulWidget {
  _ChatAppState createState() => _ChatAppState();
}

class _ChatAppState extends State<ChatApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Flutter Chat App"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.help),
              onPressed: () {
                print("pressed");
              },
            ),
          ],
        ),
        body: ListView(
          children: <Widget>[
            ChatHead(
              friendName: "Zeihan",
              lastMessage: "Awesome Flutter",
              messageTime: DateTime.now(),
            ),
            ChatHead(
              friendName: "Aulia",
              lastMessage: "Awesome Flutter!",
              messageTime: DateTime.now(),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")),
            BottomNavigationBarItem(icon: Icon(Icons.verified_user), title: Text("Chat")),
            BottomNavigationBarItem(icon: Icon(Icons.settings), title: Text("Settings"))
          ],
          onTap: (int index) {
            print("index is" + index.toString());
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print("FAB printed");
          },
          child: Icon(Icons.add),
        ),
      )

      //home: ChatView(),

    );
  }
}