
import 'package:flutter/material.dart';
import 'package:flutter_events/model/event_model.dart';
import 'package:http/http.dart' as http;

class AppModel extends ChangeNotifier{
  List<Event> events = null;

  void getEvents() async {

    String url = 'https://flutterevents.com/feed';

    final response = await http.get(url);
    events =  eventFromJson(response.body);
    notifyListeners();

  }

}