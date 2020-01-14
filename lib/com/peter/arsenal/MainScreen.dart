import 'package:flutter/material.dart';

import 'main.dart';

class MainScreen extends StatelessWidget {
  List<RouteItem> routeItems = List();

  MainScreen({Key key}) : super(key: key) {
    routeItems.add(RouteItem('Animation', ANIMATE_ALL));
    routeItems.add(RouteItem('Design', ''));
    routeItems.add(RouteItem('Forms', ''));
    routeItems.add(RouteItem('Gestures', ''));
    routeItems.add(RouteItem('Images', ''));
    routeItems.add(RouteItem('Lists', ''));
    routeItems.add(RouteItem('Maintenance', ''));
    routeItems.add(RouteItem('Navigation', NAV_ALL));
    routeItems.add(RouteItem('Networking', ''));
    routeItems.add(RouteItem('Persistence', ''));
    routeItems.add(RouteItem('Widget', ''));
    routeItems.add(RouteItem('GlobalKey', GLOBAL_KEY));
    routeItems.add(RouteItem('Container', NAV_CONTAINER));
    routeItems.add(RouteItem('ScopeModel', SCOPE_MODEL));
    routeItems.add(RouteItem('Provider', PROVIDER));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Flutter 宝典')),
        body: ListView.separated(
            itemCount: routeItems.length,
            separatorBuilder: (context, index) {
              return Divider();
            },
            itemBuilder: (context, index) {
              return Center(
                child: ListTile(
                  onTap: () {
                    print('you click ${routeItems[index].title}');
                    Navigator.of(context).pushNamed(routeItems[index].routeName);
                  },
                  title: Text(routeItems[index].title,
                      style: Theme.of(context).textTheme.headline),
                ),
              );
            }));
  }
}

class RouteItem {
  final String title;
  final String routeName;

  RouteItem(this.title, this.routeName);
}
