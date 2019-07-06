import 'package:flutter/material.dart';
import 'package:flutter_events/ui/list_card.dart';
import 'package:flutter_events/model/event_model.dart';
import 'package:flutter_events/services/api_services.dart';
import 'package:flutter_events/services/firebase_services.dart';
import 'package:provider/provider.dart';

class GlobalEventsScreen extends StatelessWidget {
  final List<Event> events;
  GlobalEventsScreen({this.events});

  final FirestoreDatabase firestoreDatabase = new FirestoreDatabase();

  @override
  Widget build(BuildContext context) {
    AppModel model = Provider.of<AppModel>(context);

    if (model.events != null) {
      return ListView.builder(
          itemCount: model.events.length,
          itemBuilder: (context, index) => InkWell(
                onTap: () => firestoreDatabase.storeNewEvent(
                    model.events[index], context),
                child: EventCard(event: model.events[index]),
              ));
    } else {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  }
}
