import 'package:flutter/material.dart';

import 'MainScreen.dart';
import 'main.dart';

class NavigatorListScreen extends StatelessWidget {
  List<RouteItem> routeItems = new List();

  NavigatorListScreen({Key key}) : super(key: key) {
    routeItems.add(RouteItem("Animate a widget across screens", NAV_ONE));
    routeItems.add(RouteItem("Navigate to a new screen and back", NAV_TWO));
    routeItems.add(RouteItem("Navigate with named routes", NAV_THREE));
    routeItems.add(RouteItem("Pass arguments to a named route", NAV_FOUR));
    routeItems.add(RouteItem("Return data from a screen", NAV_FIVE));
    routeItems.add(RouteItem("Send data to a new screen", NAV_SIX));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('页面导航'),
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
