class Peliculas{
  List<Pelicula> items = new List();

  Peliculas();

  Peliculas.fromJsonList(List<dynamic> jsonList){
    if (jsonList==null)return;
    for (var item in jsonList)
    {
      final pelicula = new Pelicula.fromJsonMap(item);
      items.add(pelicula);
    }
  }


}


class Pelicula {
  String uniqueId;

  double popularity;
  int id;
  bool video;
  int voteCount;
  double voteAverage;
  String title;
  String releaseDate;
  String originalLanguage;
  String originalTitle;
  List<int> genreIds;
  String backdropPath;
  bool adult;
  String overview;
  String posterPath;

  Pelicula({
    this.popularity,
    this.id,
    this.video,
    this.voteCount,
    this.voteAverage,
    this.title,
    this.releaseDate,
    this.originalLanguage,
    this.originalTitle,
    this.genreIds,
    this.backdropPath,
    this.adult,
    this.overview,
    this.posterPath,
  });


  Pelicula.fromJsonMap(Map<String,dynamic> jsonMap){

    popularity      = jsonMap['popularity'] /1;
    id              = jsonMap['id'];
    video           = jsonMap['video'];
    voteCount       = jsonMap['vote_count'];
    voteAverage     = jsonMap['vote_average'] /1;
    title           = jsonMap['title'];
    releaseDate     = jsonMap['releaseDate'];
    originalLanguage= jsonMap['original_language'];
    originalTitle   = jsonMap['original_title'];
    genreIds        = jsonMap['genre_ids'].cast<int>();
    backdropPath    = jsonMap['backdrop_path'];
    adult           = jsonMap['adult'];
    overview        = jsonMap['overview'];
    posterPath      = jsonMap['poster_path'];



  }

  getPosterImg(){
    if (posterPath==null){
      return 'https://us.123rf.com/450wm/pavelstasevich/pavelstasevich1811/pavelstasevich181101032/112815935-stock-vector-no-image-available-icon-flat-vector-illustration.jpg?ver=6';
    }else{
          return 'https://image.tmdb.org/t/p/w500/$posterPath';

    }
  }


    getBackgroundImg(){
    if (posterPath==null){
      return 'https://us.123rf.com/450wm/pavelstasevich/pavelstasevich1811/pavelstasevich181101032/112815935-stock-vector-no-image-available-icon-flat-vector-illustration.jpg?ver=6';
    }else{
          return 'https://image.tmdb.org/t/p/w500/$backdropPath';

    }
  }
}

