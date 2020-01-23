import 'package:flutter/material.dart';

import 'dart:math';
import 'dart:ui';

class BotonesPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _fondoApp(),
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                _titulos(),
                _botonesRedondeados()
              ]
            )
          )
        ]
      ),
      bottomNavigationBar: _bottomNavigationBar(context)
    );
  }

  Widget _fondoApp() {
    final gradiente = Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset(0.0, 0.6),
          end: FractionalOffset(0.0, 1.0),
          colors: [
            Color.fromRGBO(52, 54, 101, 1.0),
            Color.fromRGBO(35, 37, 57, 1.0)
          ]
        )
      )
    );
    final cajaRosa = Transform.rotate(
      angle: -pi / 5.0,
      child: Container(
        height: 360.0,
        width: 360.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(80.0),
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(236, 98, 188, 1.0),
              Color.fromRGBO(241, 142, 172, 1.0),
            ]
          )
        )
      )
    );
    return Stack(
      children: <Widget>[
        gradiente,
        Positioned(
          top: -100.0,
          child: cajaRosa
        )
      ]
    );
  }

  Widget _titulos() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Classify transaction', style: TextStyle(fontSize: 30.0, color: Colors.white, fontWeight: FontWeight.bold)),
            SizedBox(height: 10.0),
            Text('Classify this transaction into a particular category', style: TextStyle(fontSize: 18.0, color: Colors.white))
          ]
        )
      )
    );
  }

  Widget _bottomNavigationBar(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Color.fromRGBO(55, 57, 84, 1.0),
        primaryColor: Colors.pinkAccent,
        textTheme: Theme.of(context).textTheme.copyWith(
          caption: TextStyle(color: Color.fromRGBO(116, 117, 152, 1.0))
        )
      ),
      child: BottomNavigationBar(
        onTap: (i) {
          Navigator.pushNamed(context, 'basico');
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today, size: 30.0),
            title: Container()
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bubble_chart, size: 30.0),
            title: Container()
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.supervised_user_circle, size: 30.0),
            title: Container()
          ),
        ]
      )
    );
  }

  Widget _botonesRedondeados() {
    return Table(
      children: [
        TableRow(
          children: [
            _crearBotonRedondeado(Colors.blue, Icons.business_center, 'Menu 1'),
             _crearBotonRedondeado(Colors.purpleAccent, Icons.cached, 'Menu 2'),
          ]
        ),
        TableRow(
          children: [
             _crearBotonRedondeado(Colors.redAccent, Icons.call, 'Menu 3'),
             _crearBotonRedondeado(Colors.green, Icons.camera_rear, 'Menu 4'),
          ]
        ),
        TableRow(
          children: [
             _crearBotonRedondeado(Colors.brown, Icons.cloud_done, 'Menu 5'),
             _crearBotonRedondeado(Colors.yellowAccent, Icons.content_cut, 'Menu 6'),
          ]
        ),
        TableRow(
          children: [
             _crearBotonRedondeado(Colors.blueGrey, Icons.crop_original, 'Menu 7'),
             _crearBotonRedondeado(Colors.deepOrangeAccent, Icons.dashboard, 'Menu 8'),
          ]
        )
      ]
    );
  }

  Widget _crearBotonRedondeado(Color color, IconData icono, String texto) {
    return Container(
      margin: EdgeInsets.all(15.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Container(
            height: 180.0,
            decoration: BoxDecoration(
              color: Color.fromRGBO(62, 66, 107, 0.7)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CircleAvatar(
                  radius: 35.0,
                  backgroundColor: color,
                  child: Icon( icono, color: Colors.white, size: 30.0)
                ),
                Text(texto, style: TextStyle(color: color))
              ]
            )
          )
        )
      )
    );
  }

}