  class Cast{
    List<Actor> actores = new List();

    Cast.formJsonList(List<dynamic> jsonList ){
      if (jsonList==null) return;

      jsonList.forEach((item){
        final actor= Actor.formJsonMap(item);
        actores.add(actor);
      });


    }
  }

class Actor {
  int castId;
  String character;
  String creditId;
  int gender;
  int id;
  String name;
  int order;
  String profilePath;

  Actor({
    this.castId,
    this.character,
    this.creditId,
    this.gender,
    this.id,
    this.name,
    this.order,
    this.profilePath,
  });

  Actor.formJsonMap(Map<String, dynamic> json){
    castId     =json ['cast_id'];
    character  =json ['character'];
    creditId   =json ['credit_id'];
    gender     =json ['gender'];
    id         =json ['id'];
    name       =json ['name'];
    order      =json ['order'];
    profilePath=json ['profile_path'];
  }
    getFoton(){
    if (profilePath==null){
      return 'https://us.123rf.com/450wm/pavelstasevich/pavelstasevich1811/pavelstasevich181101032/112815935-stock-vector-no-image-available-icon-flat-vector-illustration.jpg?ver=6';
    }else{
          return 'https://image.tmdb.org/t/p/w500/$profilePath';

    }
  }
}



