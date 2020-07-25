import 'package:myapp/Message.dart';
import 'package:flutter/material.dart';

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
                      }
                  );
              }
            },
        )
    );
  }
}

