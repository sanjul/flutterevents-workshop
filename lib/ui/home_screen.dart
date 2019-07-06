import 'package:flutter/material.dart';
import 'package:flutter_events/ui/global_events_screen.dart';
import 'package:flutter_events/ui/local_events_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Image.network('https://itsallwidgets.com/images/logo.png',width: 200,),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Global',),
              Tab(text: 'Local',)
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
           GlobalEventsScreen(),
            LocalEventsScreen()
          ],
        ),
      ),
    );
  }
}
