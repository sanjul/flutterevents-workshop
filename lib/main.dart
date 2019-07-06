import 'package:flutter/material.dart';
import 'package:flutter_events/services/api_services.dart';
import 'package:flutter_events/ui/home_screen.dart';
import 'package:flutter_events/ui/splash_screen.dart';
import 'package:provider/provider.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    final AppModel model = new AppModel();
    model.getEvents();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value:model)
      ],
          child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        home: SplashScreen(),
        routes: {
          '/home': (BuildContext context) => HomeScreen()
        },
      ),
    );
  }
}
