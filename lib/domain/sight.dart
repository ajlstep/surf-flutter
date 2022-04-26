// name -  название достопримечательности
// lat, lon - координаты места
// url - путь до фотографии в интернете
// details - описание достопримечательности
// type - тип достопримечательности.

enum typeSight {
  city,
  country,
}

class Sight {
  late String name;
  late double lat;
  late double lon;
  late String details;
  late typeSight type;

  Sight(this.name, this.lat, this.lon, this.details, this.type);
}
