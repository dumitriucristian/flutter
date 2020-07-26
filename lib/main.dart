import 'package:flutter/material.dart';
import 'package:myapp/MessageList.dart';

void main() {
  runApp(EmailApp());
}

class EmailApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData( primarySwatch: Colors.blueGrey,  accentColor: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MessageList(title: 'Mail app test'),
    );
  }
}


