import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class ScopedModelDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("The scopedModelDemo rebuild");
    return ScopedModelDescendant<MyModel>(builder: (context, child, model) {
      return Scaffold(
        appBar: AppBar(
          title: Text('测试ScopeModel'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Text('count is ${model.count}'),
              RaisedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                    return SecondPage();
                  }));
                },
                child: Text('go'),
              )
            ],
          ),
        ),
      );
    });
    // TODO: implement build
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("The SecondPage rebuild");
    return ScopedModelDescendant<MyModel>(builder: (context, child, model) {
      return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            model.increment();
          },
          child: Icon(Icons.flip),
        ),
        appBar: AppBar(title: Text('第二个页面')),
        body: Center(
          child: Text("${model.count}"),
        ),
      );
    });
  }
}

class MyModel extends Model {
  int count = 0;

  void increment() {
    count++;
    notifyListeners();
  }
}
