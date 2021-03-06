import 'package:flutter/material.dart';
import 'package:myapp/MessageCompose.dart';

class ComposeButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () async {
         String intention = await Navigator.push(
             context,
             MaterialPageRoute(
                builder: (BuildContext) => MessageCompose())
         );
         Scaffold.of(context).showSnackBar(
           SnackBar(
             content: Text("Your message has been sent with $intention"),
             backgroundColor: Colors.green,
           ),
         );
      },
    );
  }
}
