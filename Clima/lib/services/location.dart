import 'package:geolocator/geolocator.dart';

class Location {
  double longitude, latitude;

  static Location defaultLocation = Location(
    latitude: 41.99646,
    longitude: 21.4314098,
  );

  @override
  String toString() {
    return "Location( longitude: $longitude, latitude: $latitude )";
  }

  Location({this.longitude, this.latitude});

  static Future<Location> getLocation() async {
    try {
      Geolocator geolocator = Geolocator();
      if (!await geolocator.isLocationServiceEnabled()) {
        throw 'Location is not availalbe';
      }
      Position position = await geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low,
      );
      return Location(
        latitude: position.latitude,
        longitude: position.longitude,
      );
    } catch (e) {
      print(e);
    }
    return null;
  }
}
