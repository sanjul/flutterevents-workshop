import 'package:flutter/material.dart';
import 'package:flutter_events/model/event_model.dart';
import 'package:flutter_html_view/flutter_html_view.dart';

class EventCard extends StatelessWidget {
  final Event event;
  EventCard({this.event});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Card(
        child: ExpansionTile(
          
          title: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Event: ${event.eventName}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: <Widget>[
                    Icon(Icons.location_on),
                    SizedBox(width: 5),
                    Text(event.city),
                  ],
                )
              ],
            ),
          ),
          children: <Widget>[
            HtmlView(data: event.description)
          ],
        ),
      ),
    );
  }
}
