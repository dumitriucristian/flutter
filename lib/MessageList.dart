import 'dart:convert';

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

  /**
   * @todo check dart Future keyword
   *
   */
  Future loadMessageList() async {
    var content = await rootBundle.loadString('data/messages.json');
    var collection = json.decode(content);
    setState(() {
      messages = collection;
    });
  }


  /**
   * @todo check dart Future keyword
   *
   */
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
            var message = messages[index];
            return ListTile(
              title: Text(message['subject']),
              isThreeLine: true,
              leading: CircleAvatar(
                  child: Text('CD')

              ),
              subtitle: Text(message['body']),

            );
          },

        )
    );
  }
}