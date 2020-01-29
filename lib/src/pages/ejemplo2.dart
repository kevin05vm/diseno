import 'package:flutter/material.dart';

import 'package:diseno/src/pages/models/comida.dart';

class EjemploPage2 extends StatefulWidget {
  @override
  _EjemploPage2State createState() => _EjemploPage2State();
}

class _EjemploPage2State extends State<EjemploPage2> {

  final _controller = ScrollController();
  bool _showBoton = false;

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    _controller.addListener(() {
      if(_controller.position.pixels <= 150) {
        setState(() => _showBoton = false);
      }
      else {
        if(!_showBoton) {
          setState(() => _showBoton = true);
        }
      }
    });
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _fondoApp(),
          _menuApp(),
          Container(
            padding: EdgeInsets.only(top: 100.0),
            child: SingleChildScrollView(
              controller: _controller,
              child: Column(
                children: <Widget>[
                  _imagen(),
                  _categoriaTexto('Your Favorite'),
                  _crearLista1(Comida().cargarITems(), _screenSize),
                  _categoriaTexto('Restaurants'),
                  _crearLista2(Comida().cargarITems(), _screenSize),
                  SizedBox(height: 400.0)
                ]
              )
            ),
          )
        ]
      ),
      floatingActionButton: Visibility(
        visible: _showBoton,
        child: SizedBox(
          height: 35.0,
          child: RaisedButton(
            onPressed: (){
              _controller.animateTo(
                0.0,
                curve: Curves.easeOut,
                duration: const Duration(milliseconds: 500),
              );
            },
            elevation: 0.0,
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                    top: Radius.circular(60.0)
              )
            ),
            color: Colors.yellowAccent,
            child: Icon(Icons.keyboard_arrow_up, color: Colors.black, size: 45.0),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked
    );
  }

  Widget _fondoApp() {
    final figura = Ink(
      height: 385.0,
      width: 385.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(360.0),
        gradient: LinearGradient(
          colors: [
            Colors.yellowAccent,
            Colors.yellowAccent
          ]
        )
      )
    );
    return Stack(
      children: <Widget>[
        Positioned(
          top: -30.0,
          left: 110.0,
          child: figura
        )
      ]
    );
  }

  Widget _menuApp() {
    return Stack(
      children: <Widget>[
        SafeArea(
          child: Container(
            child: ListTile(
              leading: IconButton(
                icon: Icon(Icons.menu),
                color: Colors.black,
                iconSize: 30.0, 
                onPressed: () {},   
              ),
              title: Text('Home', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.black)),
              trailing: IconButton(
                icon: Icon(Icons.search),
                color: Colors.black,
                iconSize: 30.0,
                onPressed: () {},   
              )
            )
          )
        )
      ]
    );
  }

  Widget _imagen() {
    final estiloText1 = TextStyle(
      color: Colors.white,
      fontSize: 22.0
    );
    final estiloText2 = TextStyle(
      color: Colors.white,
      fontSize: 18.0
    );  
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Container(
                child: FadeInImage(
                  height: 200.0,
                  image: NetworkImage('https://www.infobae.com/new-resizer/_TL4MD_ySzL3xj3ZfNkNxTgMYtY=/750x0/filters:quality(100)/s3.amazonaws.com/arc-wordpress-client-uploads/infobae-wp/wp-content/uploads/2016/06/14140637/PastasP.jpg'),
                  placeholder: AssetImage('assets/no-image.jpg'),
                  fit: BoxFit.cover,
                )
              ),
            ),
            Container(
              height: 210.0,
              padding: EdgeInsets.only(left: 15.0, top: 20.0, bottom: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text('Use Promo Code', style: estiloText1),
                  Text('Get 50% Off', style: estiloText1),
                  SizedBox(height: 35.0),
                  Text('Design by Mitesh', style: estiloText2)
                ]
              )
            )
          ]
        ),
      ),
    );
  }

  Widget _categoriaTexto(String texto) {
    final estilo = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 18.0
    );
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(top: 10.0, left: 30.0, bottom: 30.0),
      child: Text(texto, style: estilo)
    );
  }

  Widget _crearLista1(List<Comida> comida, Size tamano) {
    return Container(
      height: tamano.height * 0.24,
      child: PageView.builder(
        pageSnapping: false,
        controller: PageController(
          viewportFraction: 0.37,
          initialPage: 1
        ),
        itemCount: comida.length,
        itemBuilder: (context, i) => _tarjeta1(comida[i])
      )
    );
  }

  Widget _tarjeta1(Comida comida) {
    return Container(
      padding: EdgeInsets.only(left: 30.0),
      child: Column(
        children: <Widget>[
          Container(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: FadeInImage(
                fadeInDuration: Duration(milliseconds: 150), 
                image: NetworkImage(comida.img), 
                placeholder: AssetImage('assets/no-image.jpg'),
                height: 110.0,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(comida.texto, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
          Text(comida.precio, style: TextStyle(fontSize: 16.0))
        ]
      )
    );
  }

  Widget _crearLista2(List<Comida> comida, Size tamano) {
    return Container(
      height: tamano.height * 0.45,
      child: PageView.builder(
        pageSnapping: false,
        controller: PageController(
          viewportFraction: 0.80,
          initialPage: 0
        ),
        itemCount: comida.length,
        itemBuilder: (context, i) => Padding(
          padding: EdgeInsets.only(left: 20.0, bottom: 5.0),
          child: _tarjeta2(comida[i]),
        )
      )
    );
  }

  Widget _tarjeta2(Comida comida) {
    final estiloTexto1 = TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0);
    final estiloTexto2 = TextStyle(fontSize: 14.0, color: Colors.blueGrey);
    return Card(
      elevation: 4.0,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder( borderRadius:  BorderRadius.circular(15.0)),
      child: Column(
        children: <Widget>[
          FadeInImage(
            image: NetworkImage(comida.img),
            placeholder: AssetImage('assets/no-image.jpg'),
            fadeInDuration: Duration( milliseconds: 200 ),
            alignment: Alignment.center,
            height: 200.0,
            width: double.maxFinite,
            fit: BoxFit.cover,
            
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 5.0, top: 8.0),
                child: Text(comida.texto, style: estiloTexto1),
              ),
              SizedBox(width: 50.0),
              Row(
                children: <Widget>[
                  Icon(Icons.star, color: Colors.yellowAccent[700], size: 15.0),
                  Icon(Icons.star, color: Colors.yellowAccent[700], size: 15.0),
                  Icon(Icons.star, color: Colors.yellowAccent[700], size: 15.0),
                  Icon(Icons.star, color: Colors.yellowAccent[700], size: 15.0),
                  Icon(Icons.star_border, color: Colors.yellowAccent[700], size: 15.0)
                ]
              )
            ]
          ),
          Padding(
            padding: const EdgeInsets.only(left: 27.0, right: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(comida.texto, style: estiloTexto2),
                    Text(comida.precio, style: estiloTexto2)
                  ]
                ),
                Column(
                  children: <Widget>[
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10.0)
                      ),
                      color: Colors.greenAccent[400],
                      textColor: Colors.white,
                      onPressed: () {},
                      child: Text('20% Off', style: TextStyle(fontSize: 18.0))
                    )
                  ]
                )
              ]
            ),
          )
        ],
      ),
    );
  }

}