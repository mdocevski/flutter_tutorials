import 'dart:convert';

import 'package:clima/services/location.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const String openWeatherMapApiKey = 'f0267949db16a4fdddd6f97c40fc5b8f';
const String openWeatherMapApiBaseUri =
    'https://api.openweathermap.org/data/2.5';

class Networking {
  String _getWeatherUrl({
    @required double latitude,
    @required double longitude,
  }) =>
      '$openWeatherMapApiBaseUri/weather?lat=$latitude&lon=$longitude&appid=$openWeatherMapApiKey&units=metric';

  String _getWeatherQueryUrl({
    String q,
  }) =>
      '$openWeatherMapApiBaseUri/weather?q=$q&appid=$openWeatherMapApiKey&units=metric';

  String _getOneCallUrl({
    @required double latitude,
    @required double longitude,
  }) =>
      '$openWeatherMapApiBaseUri/onecall?lat=$latitude&lon=$longitude&appid=$openWeatherMapApiKey&units=metric';

  Future getWeatherForLocation(Location locationCoordinates) async {
    var url = _getWeatherUrl(
      latitude: locationCoordinates.latitude,
      longitude: locationCoordinates.longitude,
    );
    print(url);
    return await _fetchUrl(url);
  }

  Future getWeatherForName(String locationName) async {
    var url = _getWeatherQueryUrl(
      q: locationName,
    );
    print(url);
    return await _fetchUrl(url);
  }

  Future _fetchUrl(String url) async {
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw 'Weather info not avaialabe, ${response.statusCode}, ${response.reasonPhrase}';
    }
  }
}
