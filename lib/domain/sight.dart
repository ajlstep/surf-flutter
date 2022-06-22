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

// var listTypeSight = TypesSightGetter().getMap();

// class TypesSightGetter {
//   Map<String, TypeSyght> mp = {};

//   Map<typeSight, TypeSyght> getMap() {
//     Map<typeSight, TypeSyght> _mp = {};
//     if (mp.isEmpty) {
//       _getListTypes();
//     }
//     // while (mp.length != 6) {}
//     _mp = {
//       typeSight.hotel:
//           mp["1"] ?? const TypeSyght("hotel", "Отель", AppIcons.categoryHotel),
//       typeSight.restaurant: mp["2"] ??
//           const TypeSyght(
//               "restaurant", "Ресторан", AppIcons.categoryRestaurant),
//       typeSight.particularplace: mp["3"] ??
//           const TypeSyght("particular_place", "Особое место",
//               AppIcons.categoryParticularPlace),
//       typeSight.park:
//           mp["4"] ?? const TypeSyght("park", "Парк", AppIcons.categoryPark),
//       typeSight.museum: mp["5"] ??
//           const TypeSyght("museum", "Музей", AppIcons.categoryMuseum),
//       typeSight.cafe:
//           mp["6"] ?? const TypeSyght("cafe", "Кафе", AppIcons.categoryCafe),
//     };
//     return _mp;
//   }

//   Future<void> _getListTypes() async {
//     HttpQuery query = HttpQuery(
//         ip: "192.168.1.250",
//         port: "1515",
//         path: "gettypes",
//         isSecure: false,
//         protocol: "get");
//     var response = await query.exec();
//     if (response != null) {
//       var js = jsonDecode(response.body);
//       try {
//         var data = js["data"];
//         var arr = jsonDecode(data);
//         for (var item in arr) {
//           mp[item["id"]] = TypeSyght(
//             item["id"],
//             item["name"],
//             AppIcons().getIconForFile(item["icon"]),
//           );
//         }
//       } catch (e) {
//         print(e);
//       }
//     }
//   }
// }

