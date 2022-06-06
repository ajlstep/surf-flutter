// name -  название достопримечательности
// lat, lon - координаты места
// url - путь до фотографии в интернете
// details - описание достопримечательности
// type - тип достопримечательности.

import 'package:places/const/icons.dart';

enum typeSight {
  hotel,
  restaurant,
  particularplace,
  park,
  museum,
  cafe,
}

class Sight {
  late String name;
  late double lat;
  late double lon;
  late String details;
  late TypeSyght type;
  late List<String> imgURL;

  Sight(
    this.name,
    this.type,
    this.imgURL,
    this.details,
    this.lat,
    this.lon,
  );
}

class Visits {
  late Sight sight;
  late bool visit;
  late DateTime date;

  Visits(this.sight, this.visit, this.date);
}

class TypeSyght {
  final String id;
  final String name;
  final String imgUrl;
  const TypeSyght(this.id, this.name, this.imgUrl);
}

const listTypeSight = <typeSight, TypeSyght>{
  typeSight.hotel: TypeSyght("hotel", "Отель", AppIcons.categoryHotel),
  typeSight.restaurant:
      TypeSyght("restaurant", "Ресторан", AppIcons.categoryRestaurant),
  typeSight.particularplace: TypeSyght(
      "particular_place", "Особое место", AppIcons.categoryParticularPlace),
  typeSight.park: TypeSyght("park", "Парк", AppIcons.categoryPark),
  typeSight.museum: TypeSyght("museum", "Музей", AppIcons.categoryMuseum),
  typeSight.cafe: TypeSyght("cafe", "Кафе", AppIcons.categoryCafe),
};
