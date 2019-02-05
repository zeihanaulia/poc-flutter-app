import 'package:flutter/material.dart';
import 'package:flutter_chat_app/ChatView.dart';

class ChatHead extends StatefulWidget {
  _ChatHeadState createState() => _ChatHeadState();

  final String friendName;
  final String lastMessage;
  final DateTime messageTime;

  ChatHead({
    Key key,
    this.friendName,
    this.lastMessage,
    this.messageTime,
  }) : super(key: key);
}

class _ChatHeadState extends State<ChatHead> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        print(widget.friendName + " tapped");

        await Navigator.of(context).push(MaterialPageRoute<Null>(
            builder: (BuildContext context) {
              return ChatView(
                friendName: widget.friendName,
                lastMessage: widget.lastMessage,
              );
            },
            fullscreenDialog: true));
      },
      highlightColor: Colors.blue,
      child: Container(
        padding: EdgeInsets.all(8.0),
        width: double.infinity,
        height: 100.0,
        //color: Colors.grey[300],
        child: Row(
          children: <Widget>[
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  widget.friendName,
                  style: Theme.of(context).textTheme.title,
                ),
                Text(
                  widget.lastMessage,
                  style: Theme.of(context).textTheme.body1,
                ),
                Text(widget.messageTime.toString())
              ],
            )),
            Center(
              child: CircleAvatar(
                radius: 38.0,
                child: Text(
                  widget.friendName.substring(0, 1),
                  style: Theme.of(context)
                      .textTheme
                      .display1
                      .apply(color: Colors.white, fontSizeDelta: 3),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
