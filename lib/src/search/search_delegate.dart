import 'package:app_peliculas/src/models/pelicula_model.dart';
import 'package:app_peliculas/src/providers/peliculas_provider.dart';
import 'package:flutter/material.dart';

class DataSearch extends SearchDelegate{
  final peliculasProvider = new PeliculasProvider();

  final peliculas=[
    'Spiderman',
    'mauricio',
    'vanegas',
    'no lo c rick',
    'kakakaka',
  ];

  final peliculasRecientes=[
    'Spiderman',
    'Captain America'
  ];



  @override
  List<Widget> buildActions(BuildContext context) {
      // Las acciones de nuestro appbar

      return [
        IconButton(
          icon: Icon(Icons.clear),
          onPressed: (){
            query='';
          },
        )
      ];
    }
  
    @override
    Widget buildLeading(BuildContext context) {
      // Icono a la izquierda del appbar
      return IconButton(
        icon:AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: (){
          close(context,null);
        },
      );
    }
  
    @override
    Widget buildResults(BuildContext context) {
      //crea los restultados que vamos a mostrar
      return Container();
    }
  
    @override
    Widget buildSuggestions(BuildContext context) {
    // son las sugerencias cuando la persona escribe
    if (query.isEmpty){
      return Container();

    }

    return FutureBuilder(
      future: peliculasProvider.buscarPeliculas(query),
      builder: (BuildContext context, AsyncSnapshot<List<Pelicula>> snapshot) {
        if (snapshot.hasData){
          final peliculas = snapshot.data;
          return ListView(
            children: peliculas.map((pelicula){
              return ListTile(
                leading: FadeInImage(
                  placeholder: NetworkImage('https://us.123rf.com/450wm/pavelstasevich/pavelstasevich1811/pavelstasevich181101032/112815935-stock-vector-no-image-available-icon-flat-vector-illustration.jpg?ver=6'),
                  image: NetworkImage(pelicula.getPosterImg()),
                  width: 50.0,
                  fit: BoxFit.contain
               ),
               title: Text(pelicula.title),
               subtitle: Text(pelicula.originalTitle),
               onTap: (){
                 close(context, null);
                 pelicula.uniqueId='';
                 Navigator.pushNamed(context, 'detalle',arguments:pelicula);
               },
              );
            } ).toList()
          );
        }else{
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }


}