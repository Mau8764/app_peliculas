
import 'package:app_peliculas/src/models/pelicula_model.dart';
import 'package:flutter/material.dart';


class MovieHorizontal extends StatelessWidget {

  final List<Pelicula> peliculas;
  final Function siguientePagina;


  MovieHorizontal({@required this.peliculas,@required this.siguientePagina});

  final _pageController= new PageController(
    initialPage: 1,
    viewportFraction: 0.3
  );


  @override
  Widget build(BuildContext context) {
    final _screensize = MediaQuery.of(context).size;

    _pageController.addListener((){
      if ( _pageController.position.pixels>=_pageController.position.maxScrollExtent-200){
        siguientePagina();
      }
    });

    return Container(
      height: _screensize.height*0.24,
        child: PageView.builder(
        pageSnapping: false,
        //children: _tarjetas(context),
        controller: _pageController,
        itemCount: peliculas.length,
        itemBuilder: (context,i)=> _tarjeta(context,peliculas[i]) 
      ), 
    );
  }

  Widget _tarjeta(BuildContext context,Pelicula pelicula){
    pelicula.uniqueId='${pelicula.id}-poster';

    final peliculaTarjeta= Container(
         margin:EdgeInsets.only(right: 15.0),
         child:Column(
           children: <Widget>[
             Hero(
               tag: pelicula.uniqueId,
               child: ClipRRect(
                 borderRadius: BorderRadius.circular(10.0),
                 child: FadeInImage(
                  placeholder: AssetImage('assets/img/loading.gif'),
                  image: NetworkImage(pelicula.getPosterImg()),
                  fit: BoxFit.cover,
                  height:120.0
            ),
               ),
             ),
            Text(
              pelicula.title,
              overflow:TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.caption
            )
         ],)
       );
       return GestureDetector(
         child: peliculaTarjeta,
         onTap: (){
           Navigator.pushNamed(context, 'detalle',arguments: pelicula);

         },
       );
  }
 
  List<Widget> _tarjetas(BuildContext context){
     return peliculas.map((pelicula){
       return Container(
         margin:EdgeInsets.only(right: 15.0),
         child:Column(
           children: <Widget>[
             Hero(
               tag: pelicula.id,
               child: ClipRRect(
                 borderRadius: BorderRadius.circular(10.0),
                 child: FadeInImage(
                  placeholder: AssetImage('assets/img/loading.gif'),
                  image: NetworkImage(pelicula.getPosterImg()),
                  fit: BoxFit.cover,
                  height:120.0
            ),
               ),
             ),
            Text(
              pelicula.title,
              overflow:TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.caption
            )
         ],)
       );



     }).toList();
  }
}