import 'package:flutter/material.dart';

class AnimatedOpacityApp extends StatefulWidget {
  @override
  _AnimatedOpacityAppState createState() => _AnimatedOpacityAppState();
}

class _AnimatedOpacityAppState extends State<AnimatedOpacityApp> {
  var _visible = true;

  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.flip),
            onPressed: () {
              setState(() {
                _visible = !_visible;
              });
            }),
        appBar: AppBar(
          title: Text('AnimatedContainer Demo'),
        ),
        body: Center(
          child: AnimatedOpacity(
            duration: Duration(seconds: 1),
            // Use the properties stored in the State class.
            opacity: _visible ? 1.0 : 0.0,
            child: Container(
              width: 200,
              height: 200,
              color: Colors.green,
            ),
            curve: Curves.fastOutSlowIn,
          ),
        ),
      ),
    );
  }
}
