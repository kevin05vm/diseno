import 'package:flutter/material.dart';

class EjemploPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            _appBar(),
            SliverList(
              delegate: SliverChildListDelegate([
                _imagen(),
                SizedBox(height: 1200.0)
              ])
            )
          ]
        ),
      )
    );
  }

  Widget _appBar() {
    return SliverAppBar(
      leading: IconButton(
        icon: Icon(Icons.menu, color: Colors.black),
        onPressed: () {}
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search, color: Colors.black),
          onPressed: () {}
        )
      ],
      elevation: 0.0,
      backgroundColor: Colors.yellowAccent,
      expandedHeight: 0.0,
      floating: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text('Home', style: TextStyle(color: Colors.black, fontSize: 14.0))
      )
    );
  }

  Widget _imagen() {
    return Center(
      child: Stack(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: FadeInImage(
                  height: 150.0,
                  image: NetworkImage('https://www.elsetge.cat/myimg/f/147-1470125_download-this-wallpaper-plato-de-comida-hd.jpg'),
                  placeholder: AssetImage('assets/no-image.jpg'),
                )
              ),
              Column(
                children: <Widget>[
                  Text('c'),
                  Text('c'),
                  Text('c')
                ]
              )
            ]
          ),
    );
  }

}