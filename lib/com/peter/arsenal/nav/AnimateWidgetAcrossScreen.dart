// demo from https://flutter.dev/docs/cookbook/navigation/hero-animations
import 'package:flutter/material.dart';

String imgUrl =
    "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1578578248259&di=709e33556ab368215397dcbf3028158b&imgtype=0&src=http%3A%2F%2Fztd00.photos.bdimg.com%2Fztd%2Fw%3D700%3Bq%3D50%2Fsign%3D74a3165cd81373f0f53f6d9f94343ac6%2Fb17eca8065380cd734c32ccaa844ad345982813c.jpg";
String nav1Tag = "nav1Tag";

//Hero演示屏幕间转场动画
class Nav1MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Hero动画演示')),
        body: GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Nav1DetailScreen();
            }));
          },
          child: Hero(tag: nav1Tag, child: Image.network(imgUrl)),
        ));
  }
}

class Nav1DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hero动画演示')),
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Center(
          child: Hero(
            tag: nav1Tag,
            child: Image.network(imgUrl, width: 300, height: 200),
          ),
        ),
      ),
    );
  }
}
