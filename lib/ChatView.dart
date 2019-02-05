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
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.friendName),
      ),
      body: Column(
        children: <Widget>[
          Flexible(
            child: ListView(
              children: <Widget>[
                ChatMessages(
                  isFriend: true,
                  isNotPrevious: true,
                  friendInitial: _friendInitial,
                ),
                // ChatMessages(
                //   isFriend: false,
                //   isNotPrevious: true,
                //   friendInitial: _friendInitial,
                // ),
              ],
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
}
