 import 'dart:convert';
import 'package:myapp/ComposeButton.dart';
import 'package:myapp/Message.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:myapp/MessageDetail.dart';

class MessageList extends StatefulWidget {
  final String title;
  MessageList({ this.title });
  @override
  State<StatefulWidget> createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {

  Future<List<Message>> messages;
  void initState() {
    super.initState();
    messages = Message.browse();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: <Widget> [
            IconButton(icon: Icon(Icons.refresh), onPressed: () {
              var _messages = Message.browse();
              setState(() {
                messages = _messages;
              });
            })
          ]
        ),
        body: FutureBuilder(
            future: messages,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                case ConnectionState.active:
                  return Center(child: CircularProgressIndicator());
                case ConnectionState.done:
                  if (snapshot.hasError)
                    return Text("There was an error: ${snapshot.error} ");
                  var messages = snapshot.data;
                  return ListView.separated(
                      separatorBuilder: (BuildContext context, int index) => Divider(),
                      itemCount: messages.length,
                      itemBuilder: (BuildContext context, int index) {
                        Message message = messages[index];
                        return ListTile(
                          title: Text(message.subject),
                          isThreeLine: true,
                          leading: CircleAvatar(child: Text('CD')),
                          subtitle: Text(message.body),
                        );
                       },
                  );
              };
            },
         ),
         subtitle: Text(message.body),
         onTap: () {
         Navigator.push(context,
         MaterialPageRoute(
            builder: (BuildContext context) => MessageDetail(message.subject, message.body)));
              }
            );
          },
        ),
      floatingActionButton: ComposeButton(),
    );
  }
}

