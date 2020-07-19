import 'dart:convert';
import 'package:myapp/Message.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MessageList extends StatefulWidget {
  final String title;
  MessageList({ this.title });
  @override
  State<StatefulWidget> createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {

  var messages = const [];

  Future loadMessageList() async {
    String content = await rootBundle.loadString('data/messages.json');
    List collection = json.decode(content);
    List <Message> _messages = collection.map((json) => Message.fromJson(json) ).toList();
    setState(() {
      messages = _messages;
    });
  }

  void initState() {
    loadMessageList();
    super.initState();
  }

  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ListView.separated(
          separatorBuilder: (BuildContext context, int index) => Divider(),
          itemCount: messages.length,
          itemBuilder: (BuildContext context, int index)  {
            Message message = messages[index];
            return ListTile(
              title: Text(message.subject),
              isThreeLine: true,
              leading: CircleAvatar(
                  child: Text('CD')

              ),
              subtitle: Text(message.body),
            );
          },
        )
    );
  }
}