import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
    ) 
  );
}

class Home extends StatefulWidget  {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  
  AnimationController _animationController;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _animation = Tween<double>(begin: 0, end: 300).animate(_animation);
    _animation.addStatusListener((status) { 
      if(status == AnimationStatus.completed){
      _animationController.forward();
      }else if(status == AnimationStatus.dismissed){
      _animationController.forward();
      }
    });

    _animationController.forward();

  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedLogo(_animation);
  }
}

class AnimatedLogo extends AnimatedWidget {
  AnimatedLogo(Animation<double> _animation) : super(listenable: _animation);
  @override
  Widget build(BuildContext context) {
    Animation<double> _animation = listenable;
    return Center(
      child: Container(
        width: _animation.value,
        height: _animation.value,
        child: FlutterLogo(),
      ),
    );
  }  
}
