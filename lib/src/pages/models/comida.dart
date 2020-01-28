class Comida {
  String img;
  String texto;
  String precio;

  List<Comida> cargarITems() {
    List<Comida> lista = new List<Comida>();

    Comida comida1 = new Comida();
    comida1.img = 'http://www.hdfondos.org/file/3932/728x410/16:9/crepes-with-honey_279142462.jpg';
    comida1.texto = 'Hot Cakes';
    comida1.precio = '\$10.0';
    lista.add(comida1);

    Comida comida2 = new Comida();
    comida2.img = 'https://www.itl.cat/pngfile/big/147-1470282_imagenes-de-uas-comidas-para-escritorio-en-hd.jpg';
    comida2.texto = 'Arrachera';
    comida2.precio = '\$50.0';
    lista.add(comida2);

    Comida comida3 = new Comida();
    comida3.img = 'https://www.elsetge.cat/myimg/f/147-1470261_platos-de-comida-rapida.jpg';
    comida3.texto = 'Hamburguesa';
    comida3.precio = '\$35.50';
    lista.add(comida3);

    Comida comida4 = new Comida();
    comida4.img = 'https://c4.wallpaperflare.com/wallpaper/834/257/230/comida-pescado-plato-verduras-wallpaper-preview.jpg';
    comida4.texto = 'Ensalada';
    comida4.precio = '\$13.0';
    lista.add(comida4);

    Comida comida5 = new Comida();
    comida5.img = 'http://www.hdfondos.eu/pictures/2014/0727/1/pizza-hd-pictures-images-2267.jpg';
    comida5.texto = 'Pizza';
    comida5.precio = '\$24.0';
    lista.add(comida5);

    return lista;
  }

}