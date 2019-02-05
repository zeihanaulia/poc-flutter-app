import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_chat_app/ChatMessages.dart';

class ChatView extends StatefulWidget {
  ChatView({Key key, this.friendName = "", this.lastMessage = ""})
      : super(key: key);

  _ChatViewState createState() => _ChatViewState();

  final String friendName;
  final String lastMessage;
}

class _ChatViewState extends State<ChatView> {
  String _friendInitial;

  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      _friendInitial = widget.friendName.substring(0, 1);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    loadMessageDetails();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.friendName),
      ),
      body: Column(
        children: <Widget>[
          Flexible(
            child: FutureBuilder(
              future: loadMessageDetails(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                print('$snapshot');
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    List<ChatMessages> chatMessagesWidgets = List();
                    List<dynamic> chatMessageList = snapshot.data;
                    chatMessageList.forEach((_message) {
                      print('$_message');
                      chatMessagesWidgets.add(ChatMessages(
                        friendInitial: "T",
                        isFriend: true,
                        isNotPrevious: true,
                        message: _message['content'],
                      ));
                    });
                    return ListView(children: chatMessagesWidgets);
                  } else {
                    return Center(child: Text('No message not found'));
                  }
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: TextFormField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: "Type in here",
                      labelText: "Your Message",
                      helperText: "tulis disini",
                    ),
                    onFieldSubmitted: (String _message) {
                      print("send message: " + _message);
                    },
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.send,
                    color: Colors.blue,
                  ),
                  onPressed: () {
                    print("send message from " + _controller.text);
                    setState(() {
                      _controller.text = "";
                    });
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<List> loadMessageDetails() async {
    String messageDetailsString = await DefaultAssetBundle.of(context)
        .loadString("assets/messageDetails.json");
    Map<String, dynamic> mappedMessage = json.decode(messageDetailsString);
    List<dynamic> messages = mappedMessage['12345']['messages'];
    return messages;
  }

  List<Widget> getMessages() {
    List<Widget> tempList = List();

    loadMessageDetails().then((_value) {
      if (_value != null) {
        tempList.add(Text('no message'));
        print('$_value');
      } else {
        tempList.add(Text('no message'));
      }
    });

    return tempList;
  }
}
