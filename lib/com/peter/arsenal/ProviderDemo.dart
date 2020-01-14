//import 'package:flutter/foundation.dart';
//import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';
//
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

///// This is an example of a counter application using `provider` + [ChangeNotifier].
/////
///// It builds a typical `+` button, with a twist: the texts using the counter
///// are built using the localization framework.
/////
///// This shows how to bind our custom [ChangeNotifier] to things like [LocalizationsDelegate].
//
//
//class Counter with ChangeNotifier {
//  int _count = 0;
//  int get count => _count;
//
//  void increment() {
//    _count++;
//    notifyListeners();
//  }
//}
//
//class ProviderDemo extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return MultiProvider(
//      providers: [
//        ChangeNotifierProvider(create: (_) => Counter()),
//      ],
//      child: Consumer<Counter>(
//        builder: (context, counter, _) {
//          return MaterialApp(
//            supportedLocales: const [Locale('en')],
//            localizationsDelegates: [
//              DefaultMaterialLocalizations.delegate,
//              DefaultWidgetsLocalizations.delegate,
//              _ExampleLocalizationsDelegate(counter.count),
//            ],
//            home: const MyHomePage(),
//          );
//        },
//      ),
//    );
//  }
//}
//
//class ExampleLocalizations {
//  static ExampleLocalizations of(BuildContext context) {
//    return Localizations.of<ExampleLocalizations>(context, ExampleLocalizations);
//  }
//
//  const ExampleLocalizations(this._count);
//
//  final int _count;
//
//  String get title => 'Tapped $_count times';
//}
//
//class _ExampleLocalizationsDelegate extends LocalizationsDelegate<ExampleLocalizations> {
//  const _ExampleLocalizationsDelegate(this.count);
//
//  final int count;
//
//  @override
//  bool isSupported(Locale locale) => locale.languageCode == 'en';
//
//  @override
//  Future<ExampleLocalizations> load(Locale locale) {
//    return SynchronousFuture(ExampleLocalizations(count));
//  }
//
//  @override
//  bool shouldReload(_ExampleLocalizationsDelegate old) => old.count != count;
//}
//
//class MyHomePage extends StatelessWidget {
//  const MyHomePage({Key key}) : super(key: key);
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      /// Tons of small widgets!
//      ///
//      /// Splitting our app in small widgets like [Title] or [CounterLabel] is
//      /// useful for rebuild optimization.
//      ///
//      /// Since they are instanciated using `const`, they won't unnecessarily
//      /// rebuild when their parent changes.
//      /// But they can still have dynamic content, as they can obtain providers!
//      ///
//      /// This means only the widgets that depends on a provider to rebuild when they change.
//      /// Alternatively, we could use [Consumer] or [Selector] to acheive the
//      /// same result.
//      appBar: AppBar(title: const Title()),
//      body: const Center(child: CounterLabel()),
//      floatingActionButton: const IncrementCounterButton(),
//    );
//  }
//}
//
//class IncrementCounterButton extends StatelessWidget {
//  const IncrementCounterButton({Key key}) : super(key: key);
//
//  @override
//  Widget build(BuildContext context) {
//    return FloatingActionButton(
//      onPressed: () {
//        Provider.of<Counter>(context, listen: false).increment();
//      },
//      tooltip: 'Increment',
//      child: const Icon(Icons.add),
//    );
//  }
//}
//
//class CounterLabel extends StatelessWidget {
//  const CounterLabel({Key key}) : super(key: key);
//
//  @override
//  Widget build(BuildContext context) {
//    final counter = Provider.of<Counter>(context);
//    return Column(
//      mainAxisSize: MainAxisSize.min,
//      mainAxisAlignment: MainAxisAlignment.center,
//      children: <Widget>[
//        const Text(
//          'You have pushed the button this many times:',
//        ),
//        Text(
//          '${counter.count}',
//          style: Theme.of(context).textTheme.display1,
//        ),
//      ],
//    );
//  }
//}
//
//class Title extends StatelessWidget {
//  const Title({Key key}) : super(key: key);
//
//  @override
//  Widget build(BuildContext context) {
//    return Text(ExampleLocalizations.of(context).title);
//  }
//}
Navigator navigator;


class ProviderDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Consumer<Data>(builder: (context, value, child) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(onPressed: () {
//          Provider.of<Data>(context).increment();
            Navigator.push(
                context, MaterialPageRoute(builder: (_)=>SecondPage()));
          }),
          appBar: AppBar(title: Text('第一个页面')),
          body: Center(
            child: Text("${value.count}"),
          ),
        );
      });
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Data>(builder: (_, value, child) {
      return Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: () {
          Provider.of<Data>(context).increment();//todo listen false 的区别
        }),
        appBar: AppBar(title: Text('第二个页面')),
        body: Center(
          child: Text("${value.count}"),
        ),
      );
    });
  }
}

class Data extends ChangeNotifier {
  int count = 0;

  void increment() {
    count++;
    notifyListeners();
  }
}
