import 'package:flutter/material.dart';

class BasicoPage extends StatelessWidget {

  final estiloTitulo = TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold);
  final estiloSubTitulo = TextStyle(fontSize: 18.0, color: Colors.grey);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _crearImagen(),
            _crearTitulo(),
            _crearAcciones(),
            _crearTexto(),
            _crearTexto(),
            _crearTexto()
          ]
        )
      )
    );
  }

  Widget _crearImagen() {
    return Container(
      width: double.infinity,
      child: Image(
        image: NetworkImage('https://images.pexels.com/photos/814499/pexels-photo-814499.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
        fit: BoxFit.cover,
        height: 200.0
      )
    );
  }

  Widget _crearTitulo() {
    return SafeArea(
      child: Container(
              padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Lago con un puente', style: estiloTitulo),
                        SizedBox(height: 7.0),
                        Text('Un lago en Alemania', style: estiloSubTitulo)
                      ]
                    )
                  ),
                  Icon(Icons.star, size: 30.0, color: Colors.red),
                  Text('41', style: TextStyle(fontSize: 20.0))
                ]
              )
            ),
    );
  }

  Widget _crearAcciones() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _accion(Icons.call, 'CALL'),
        _accion(Icons.near_me, 'ROUTE'),
        _accion(Icons.share, 'SHARE')
      ]
    );
  }

  Widget _accion(IconData icon, String texto) {
    return Column(
      children: <Widget>[
        Icon(icon, color: Colors.blue, size: 40.0),
        SizedBox(height: 5.0),
        Text(texto, style: TextStyle(color: Colors.blue, fontSize: 15.0))
      ]
    );
  }

  Widget _crearTexto() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 40.0),
        child: Text(
          'Proident eu officia sint excepteur qui quis et do. Qui culpa id et qui consectetur labore ea nisi sunt ullamco quis cupidatat. Cillum aliquip mollit mollit veniam cupidatat Lorem esse veniam sit proident elit. Veniam incididunt dolor mollit aliquip enim aute sunt ea aliqua nostrud do tempor Lorem duis. Voluptate esse amet proident elit tempor do adipisicing ut laborum laborum voluptate velit amet. Voluptate anim consectetur enim ipsum do nostrud aute qui esse excepteur in.',
          textAlign: TextAlign.justify
        )
      ),
    );
  }

}