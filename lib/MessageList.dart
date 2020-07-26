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

  List<Message> messages = [];
  var url = 'https://run.mocky.io/v3/95626e8b-d1d3-4e8f-bb2f-8099fa603353';

  Future loadMessageList() async {
    //load data from json
    //String content = await rootBundle.loadString('data/messages.json');
    //load data from http
    http.Response response = await http.get(url);

    /**
     * @todo use Automati JSON serialization
     */
    List collection = json.decode(response.body);
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
