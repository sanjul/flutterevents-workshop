import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return  SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  Animation<double> _logoAnimation;
  AnimationController _logoAnimationController;

  final _opacityTween =  Tween<double>(begin: 0.1, end: 1.0);

  @override
  void initState() {
    super.initState();
    _logoAnimationController =  AnimationController(
        vsync: this, duration:  Duration(milliseconds: 2000));
    _logoAnimation =  CurvedAnimation(
        parent: _logoAnimationController, curve: Curves.easeIn);
    _logoAnimationController.addListener(() => this.setState(() {}));
    _logoAnimationController.forward();

    _logoAnimation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
         Navigator.of(context).pushReplacementNamed('/home');
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _logoAnimationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Material(
      color: Colors.black87,
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
           Transform.translate(
            offset:  Offset(0.0, _logoAnimation.value * -20),
            child:  Opacity(
              opacity: _opacityTween.evaluate(_logoAnimation),
              child:  Image.network('https://itsallwidgets.com/images/logo.png',width: 200,),
            ),
          )
        ],
      ),
    );
  }
}