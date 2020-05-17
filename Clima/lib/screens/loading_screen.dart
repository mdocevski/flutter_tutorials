import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart' as spinkit;

import 'location_screen.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getWeatherData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: spinkit.SpinKitDoubleBounce(
          size: 100,
          color: Color(0xFF0000),
        ),
      ),
    );
  }

  void getWeatherData() async {
    try {
      var weatherModel = await WeatherModel.getLocationWeather();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LocationScreen(locationWeather: weatherModel),
        ),
      );
    } catch (e) {
      print(e);
    }
  }
}
