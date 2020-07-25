import 'package:http/http.dart' as http;
import 'dart:convert';

class Message {
  String subject;
  String body;

  Message(this.subject, this.body);
  Message.fromJson(Map<String, dynamic> json) :  subject = json['subject'], body = json['body'];

  static Future<List<Message>> browse() async {
      //load data from json
      //String content = await rootBundle.loadString('data/messages.json');

      var url = 'https://run.mocky.io/v3/95626e8b-d1d3-4e8f-bb2f-8099fa603353';
      http.Response response = await http.get(url);
      await Future.delayed(Duration(seconds: 3));

      /**
       * @todo use Automati JSON serialization
       */
      List collection = json.decode(response.body);
      List <Message> _messages = collection.map((json) => Message.fromJson(json) ).toList();

      return _messages;
  }
}