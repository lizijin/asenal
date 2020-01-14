import 'package:flutter/material.dart';

var globalKey = GlobalKey();

class GlobalKeyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('GlobalKey')),
      body: Center(
        key: globalKey,
        child: Center(
//          key: globalKey,
          child: Text('Center'),
        ),
      ),
    );
  }
}
