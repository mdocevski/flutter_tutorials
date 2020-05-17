import 'package:clima/services/weather.dart';
import 'package:clima/utilities/constants.dart';
import 'package:flutter/material.dart';

import 'city_screen.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.locationWeather});

  final WeatherModel locationWeather;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  int temp;
  int condition;
  String cityName;
  String weatherDescription;
  String weatherEmoji;

  @override
  void initState() {
    super.initState();
    updateUi(widget.locationWeather);
  }

  void updateUi(WeatherModel weatherData) {
    setState(() {
      if (weatherData != null) {
        var tempDouble = weatherData?.weatherData['main']['temp'] ?? 0.0;
        temp = tempDouble.toInt();
        condition = weatherData?.weatherData['weather'][0]['id'] ?? 0;
        cityName = weatherData.weatherData['name'] ?? 'Unknown';
        weatherDescription = "${weatherData.getMessage(temp)} in $cityName!";
        weatherEmoji = '${weatherData.getWeatherIcon(condition) ?? "Error"}️';
      } else {
        temp = 0;
        condition = 0;
        cityName = "Location not available";
        weatherDescription = "Not avaiable";
        weatherEmoji = "Error";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () async {
                      WeatherModel weatherModel =
                          await WeatherModel.getLocationWeather();
                      updateUi(weatherModel);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () async {
                      String selectedCityName = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CityScreen(),
                        ),
                      );
                      if (selectedCityName != null &&
                          selectedCityName.isNotEmpty) {
                        updateUi(
                          await WeatherModel.getWeatherForCityName(
                              selectedCityName),
                        );
                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      temp.toString(),
                      style: kTempTextStyle,
                    ),
                    Text(
                      weatherEmoji,
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  weatherDescription,
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
