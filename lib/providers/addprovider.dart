import 'package:flutter/material.dart';
import 'package:places/domain/sight.dart';

class AddSight extends ChangeNotifier {
  TypeSyght? type;
  String name = "";
  String lat = "";
  String lon = "";
  String description = "";
  List<String> imgUrls = [];
  bool ifCheck = false;

  // static const double _minLat = -90;
  // static const double _maxLat = 90;
  // static const double _minLon = -180;
  // static const double _maxLon = 180;

  // void modLat(String slat) {
  //   double vlat = double.parse(slat);
  //   if (vlat < _minLat) {
  //     lat = _minLat.toString();
  //   } else if (vlat > _maxLat) {
  //     lat = _maxLat.toString();
  //   } else {
  //     lat = slat;
  //   }
  //   filterAndNotify();
  // }

  void modLat(String text) {
    lat = text;
    filterAndNotify();
  }

  void modLon(String text) {
    lon = text;
    filterAndNotify();
  }

  void modDescription(String text) {
    description = text;
    filterAndNotify();
  }

  void modName(String text) {
    name = text;
    filterAndNotify();
  }
  // void modLon(String slon) {
  //   double vlon = double.parse(slon);
  //   if (vlon < _minLon) {
  //     lon = _minLon.toString();
  //   } else if (vlon > _maxLon) {
  //     lon = _maxLon.toString();
  //   } else {
  //     lon = slon;
  //   }
  //   filterAndNotify();
  // }

  // modName(String name) {
  //   this.name = name;
  //   log(name);
  //   print(this.name);
  //   filterAndNotify();
  // }

  // void modDescr(String descr) {
  //   description = descr;
  //   filterAndNotify();
  // }

  void filterAndNotify() {
    ifCheck = name != "" &&
        // type != null &&
        description != "" &&
        lat != "" &&
        lon != "";
    notifyListeners();
  }
}
