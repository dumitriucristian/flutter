import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessageDetail extends StatelessWidget {

  final String subject;
  final String body;

  MessageDetail(this.subject, this.body);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text(this.subject)),
      body: Center(child: Text(this.body)));
  }
}

