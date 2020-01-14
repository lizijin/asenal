import 'package:flutter/material.dart';

import 'MainScreen.dart';
import 'main.dart';

class AnimationListScreen extends StatelessWidget {
  final List<RouteItem> routeItems = new List();

  AnimationListScreen({Key key}) : super(key: key) {
    routeItems.add(RouteItem("Animate a page route transition", ANIMATE_ONE));
    routeItems.add(RouteItem("Animate a widget using a physics simulation", ANIMATE_TWO));
    routeItems.add(RouteItem("Animate Container", ANIMATE_THREE));
    routeItems.add(RouteItem("Animate Opacity", ANIMATE_FOUR));
    routeItems.add(RouteItem("Align Transition", ANIMATE_FIVE));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('动画列表'),
      ),
      body: ListView.separated(
        itemCount: routeItems.length,
        separatorBuilder: (context, index) => Divider(),
        itemBuilder: (context, index) {
          return ListTile(
              title: Text(
                routeItems[index].title,
                style: Theme.of(context).textTheme.title,
              ),
              onTap: () {
                Navigator.of(context).pushNamed(routeItems[index].routeName);
              });
        },
      ),
    );
  }
}
