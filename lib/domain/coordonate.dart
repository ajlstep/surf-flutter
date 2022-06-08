import 'dart:math' as math;

/// Модель географических координат
class Coordonate {
  final double lat;
  final double lon;

  const Coordonate(this.lat, this.lon);

  /// данные в м
  static double _distanceBetween(
    Coordonate from,
    Coordonate to,
  ) {
    const earthRadius = 6378137.0;
    final dLat = _toRadians(to.lat - from.lat);
    final dLon = _toRadians(to.lon - from.lon);

    final a = math.pow(math.sin(dLat / 2), 2) +
        math.pow(math.sin(dLon / 2), 2) *
            math.cos(_toRadians(from.lat)) *
            math.cos(_toRadians(to.lat));

    final c = 2 * math.asin(math.sqrt(a));

    // ignore: avoid_print
    //print(earthRadius * c);

    return earthRadius * c;
  }

  static double _toRadians(double degree) {
    return degree * math.pi / 180;
  }

  static bool _arePointsNear(Coordonate checkPoint, Coordonate centerPoint,
      double kmstart, double kmend) {
    var ky = 40000 / 360;
    var kx = math.cos(math.pi * centerPoint.lat / 180.0) * ky;
    var dx = (centerPoint.lon - checkPoint.lon) * kx;
    var dy = (centerPoint.lat - checkPoint.lat) * ky;
    var valSqrt = math.sqrt(dx * dx + dy * dy);
    // print("1: ${(valSqrt * 1000).toString()}");
    return kmstart <= valSqrt && valSqrt <= kmend;
  }

  bool ifNear(Coordonate coord, double kmstart, double kmend) {
    return _arePointsNear(coord, this, kmstart, kmend);
  }

  bool ifNrear2(Coordonate coord, double kmstart, double kmend) {
    var dist = _distanceBetween(this, coord);
    // print("2: ${dist.toString()}");
    return kmstart <= dist && dist <= kmend;
  }
}
