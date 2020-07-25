import 'package:myapp/Message.dart';
import 'package:flutter/material.dart';

class MessageList extends StatefulWidget {
  final String title;
  MessageList({ this.title });
  @override
  State<StatefulWidget> createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {

  List<Message> messages = [];
  var url = 'https://run.mocky.io/v3/95626e8b-d1d3-4e8f-bb2f-8099fa603353';
  bool isLoading = true;

  Future loadMessageList() async {
    List<Message> _messages = await Message.browse();
    setState(() {
      messages = _messages;
      isLoading = false;
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
        body: isLoading
            ? Center( child: CircularProgressIndicator())
            : ListView.separated(
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