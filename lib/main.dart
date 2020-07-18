import 'package:flutter/material.dart';

void main() {
  runApp(EmailApp());
}

class EmailApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        accentColor: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Mail app test'),
    );
  }
}

class MyHomePage extends StatelessWidget {

  final String title;
  var messages = const [
    "My first message",
    "My second message",
    "My third message",
    "My forth message",
    "My fith message",

  ];
  //constructor
  MyHomePage({this.title});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.separated(
        separatorBuilder: (BuildContext context, int index) => Divider(),
        itemCount:messages.length,
        itemBuilder: (BuildContext context, int index)  {
          var title = messages[index];
          return ListTile(
            title: Text(title),
            isThreeLine: true,
            leading: CircleAvatar(
              child: Text('CD')

            ),
            subtitle: Text("Some text to see that is very long and hard to read "),

          );
        },

      )
    );
  }
}
