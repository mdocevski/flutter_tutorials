import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

class WeatherModel {
  WeatherModel({this.weatherData});

  dynamic weatherData;

  static Future<WeatherModel> getLocationWeather() async {
    try {
      return WeatherModel(
        weatherData: await Networking()
            .getWeatherForLocation(await Location.getLocation()),
      );
    } catch (e) {
      print(e);
      return null;
    }
  }

  static Future<WeatherModel> getWeatherForCityName(String cityName) async {
    try {
      return WeatherModel(
        weatherData: await Networking().getWeatherForName(cityName),
      );
    } catch (e) {
      print(e);
      return null;
    }
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
