import 'package:flutter/material.dart';
import 'package:places/domain/coordonate.dart';
import 'package:places/domain/sight.dart';
import 'package:places/mocks.dart';

class Filters extends ChangeNotifier {
  final List<TypeSyght> _mocks = listTypeSight.values.toList();
  final List<TypeSyght> _selectedTypeSight = [];
  List<Sight> _filteredSight = [];
  double distanceStart = 100;
  double distanceEnd = 10000;
  final double min = 100;
  final double max = 10000;
  final _myCoord = mocksPredefCurrentLocation;

  int get count => _filteredSight.length;
  List<TypeSyght> get mocks => _mocks;
  List<TypeSyght> get selectedTypeSight => _selectedTypeSight;
  List<Sight> get filteredSight => _filteredSight;

  void clear() {
    _selectedTypeSight.clear();
    distanceStart = min;
    distanceEnd = max;
    filterAndNotify();
  }

  void _selectType(TypeSyght typeS) {
    _selectedTypeSight.add(typeS);
  }

  void _unselectType(TypeSyght typeS) {
    _selectedTypeSight.remove(typeS);
  }

  void filterAndNotify() {
    _filteredSight = mocksPredef
        .where(
          (element) =>
              _selectedTypeSight.contains(element.type) &&
              returnData(element, distanceStart, distanceEnd),
          /*Coordonate(element.lat, element.lon)
                  .ifNear(_myCoord, distanceStart / 1000, distanceEnd / 1000) &&
              Coordonate(element.lat, element.lon)
                  .ifNrear2(_myCoord, distanceStart, distanceEnd),*/
        )
        .toList();
    notifyListeners();
  }

  bool returnData(element, distanceStart, distanceEnd) {
    // final dist1 = Coordonate(element.lat, element.lon)
    //     .ifNear(_myCoord, distanceStart / 1000, distanceEnd / 1000);

    final dist2 = Coordonate(element.lat, element.lon)
        .ifNrear2(_myCoord, distanceStart, distanceEnd);

    return dist2;
  }

  void pressType(TypeSyght typeS) {
    if (_selectedTypeSight.contains(typeS)) {
      _unselectType(typeS);
    } else {
      _selectType(typeS);
    }
    filterAndNotify();
  }

  void changeDistance(double start, double end) {
    distanceStart = start;
    distanceEnd = end;
    filterAndNotify();
  }
}
