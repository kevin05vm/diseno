import 'package:flutter/material.dart';

import 'package:flutter/services.dart';

import 'package:diseno/src/pages/basico_page.dart';
import 'package:diseno/src/pages/scroll_page.dart';
import 'package:diseno/src/pages/botones_page.dart';
import 'package:diseno/src/pages/ejemplo2.dart';

void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle( SystemUiOverlayStyle.light.copyWith(
          statusBarColor: Colors.transparent
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'ejemplo',
      routes: {
        'basico' : (BuildContext context) => BasicoPage(),
        'scroll' : (BuildContext context) => ScrollPage(),
        'botones' : (BuildContext context) => BotonesPage(),
        'ejemplo' : (BuildContext context) => EjemploPage2() 
      }
    );
  }
}