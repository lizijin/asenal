import 'package:arsenal/com/peter/arsenal/ContainerScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scoped_model/scoped_model.dart';

import 'AnimationListScreen.dart';
import 'GlobalKeyScreen.dart';
import 'MainScreen.dart';
import 'NavigatorListScreen.dart';
import 'ProviderDemo.dart';
import 'ScopedModelDemo.dart';
import 'animation/AlignTransitionDemo.dart';
import 'animation/AnimateContainerDemo.dart';
import 'animation/AnimateOcpacityDemo.dart';
import 'animation/AnimatePageRouteTransition.dart';
import 'animation/AnimateWidgetSimulation.dart';
import 'nav/AnimateWidgetAcrossScreen.dart';
import 'nav/NavScreen2.dart';
import 'nav/NavigateWithNamedRoutes.dart';
import 'nav/PassArgumentsToNamedRoute.dart';
import 'nav/ReturnDataFromScreen.dart';
import 'nav/SendDataToScreen.dart';

//import 'MainScreen.dart';

const NAV_ALL = '/nav/all';
const NAV_ONE = '/nav/1';
const NAV_TWO = '/nav/2';
const NAV_THREE = '/nav/3';
const NAV_THREE_SUB = '/nav/3/1';
const NAV_FOUR = '/nav/4';
const NAV_FIVE = '/nav/5';
const NAV_SIX = '/nav/6';

const ANIMATE_ALL = '/ani/all';
const ANIMATE_ONE = '/ani/1';
const ANIMATE_TWO = '/ani/2';
const ANIMATE_THREE = '/ani/3';
const ANIMATE_FOUR = '/ani/4';
const ANIMATE_FIVE = '/ani/5';

const ANIMATION_ALL = '/ani/all';

const GLOBAL_KEY = '/nav/global';
const NAV_CONTAINER = '/nav/container';
const SCOPE_MODEL = '/scope/model';
const PROVIDER = '/provider';

void main() {
  runApp(MyApp());
}

var routes = <String, WidgetBuilder>{
  '/': (_) => MainScreen(),
  NAV_ALL: (_) => NavigatorListScreen(),
  NAV_ONE: (_) => Nav1MainScreen(),
  NAV_TWO: (_) => Nav2MainScreen(),
  NAV_THREE: (_) => Nav3MainScreen(),
  NAV_THREE_SUB: (_) => Nav3SubScreen(),
  NAV_FOUR: (_) => Nav4MainScreen(),
  NAV_FIVE: (_) => Nav5MainScreen(),
  NAV_SIX: (_) => TodosScreen(
        todos: List.generate(
          20,
          (i) => Todo(
            'Todo $i',
            'A description of what needs to be done for Todo $i',
          ),
        ),
      ),
  ExtractArgumentsScreen.routeName: (_) => ExtractArgumentsScreen(),
  GLOBAL_KEY: (_) => GlobalKeyScreen(),
  NAV_CONTAINER: (_) => ContainerScreen(),
  ANIMATE_ALL: (_) => AnimationListScreen(),
  ANIMATE_ONE: (_) => Page1(),
  ANIMATE_TWO: (_) => PhysicsCardDragDemo(),
  ANIMATE_THREE: (_) => AnimatedContainerApp(),
  ANIMATE_FOUR: (_) => AnimatedOpacityApp(),
  ANIMATE_FIVE: (_) => AlignTransitionApp(),
  SCOPE_MODEL: (_) => ScopedModelDemo(),
  PROVIDER: (_) => ProviderDemo(),
};

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Data(),
        )
      ],
      child: ScopedModel(
        //ScopedModel 不会rebuild整个widgetTree
        model: MyModel(),
        child: MaterialApp(
          title: 'Flutter 宝典',
          theme: ThemeData(
            // This is the theme of your application.
            //
            // Try running your application with "flutter run". You'll see the
            // application has a blue toolbar. Then, without quitting the app, try
            // changing the primarySwatch below to Colors.green and then invoke
            // "hot reload" (press "r" in the console where you ran "flutter run",
            // or simply save your changes to "hot reload" in a Flutter IDE).
            // Notice that the counter didn't reset back to zero; the application
            // is not restarted.
            primarySwatch: Colors.blue,
          ),
          initialRoute: '/',
          routes: routes,
          onGenerateRoute: (settings) {
            if (settings.name == PassArgumentsScreen.routeName) {
              final ScreenArguments args = settings.arguments;

              return MaterialPageRoute(
                builder: (context) {
                  return PassArgumentsScreen(
                    title: args.title,
                    message: args.message,
                  );
                },
              );
            }
            return null;
          },
        ),
      ),
    );
  }
}
