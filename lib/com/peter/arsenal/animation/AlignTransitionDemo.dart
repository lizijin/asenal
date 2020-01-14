import 'package:flutter/material.dart';

class AlignTransitionApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AlignTransitionState();
    ;
  }
}

class _AlignTransitionState extends State<AlignTransitionApp>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  Animation<Alignment> _animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _animation = _controller.drive(
        AlignmentTween(begin: Alignment.topLeft, end: Alignment.center)
            .chain(CurveTween(curve: Curves.ease)));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            _controller.reset();
            _controller.forward();
          },
          child: Icon(Icons.flip)),
      appBar: AppBar(
        title: Text('AlignTransitionDemo'),
      ),
      body: Center(
        child: AlignTransition(
          alignment: _animation,
          child: Text("Hello"),
        ),
      ),
    );
  }
}
