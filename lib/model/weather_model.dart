import 'dart:convert';

import 'package:http/http.dart';

class Weather {
  String? city, country, condition, windDir;
  double? temp, windSpeed, pressure, feelsLike, uv, gust;
  int? cloud, humidity, codeImage;

  Weather({
    required this.city,
    required this.country,
    required this.condition,
    required this.temp,
    required this.windSpeed,
    required this.windDir,
    required this.pressure,
    required this.cloud,
    required this.feelsLike,
    required this.gust,
    required this.humidity,
    required this.uv,
    required this.codeImage,
  });
}

Future getWeather(String city) async {
  String url =
      "https://api.weatherapi.com/v1/current.json?key=c90a97d6ba044add85824225222207&q=$city";
  Response res = await get(Uri.parse(url));

  var json = jsonDecode(res.body);

  if (res.statusCode == 200) {
    return Weather(
      city: json['location']['name'],
      country: json['location']['country'],
      condition: "Its ${json['current']['condition']['text']}",
      codeImage: json['current']['condition']['code'],
      temp: json['current']['temp_c'],
      windSpeed: json['current']['wind_kph'],
      windDir: json['current']['wind_dir'],
      pressure: json['current']['pressure_mb'],
      cloud: json['current']['cloud'],
      feelsLike: json['current']['feelslike_c'],
      gust: json['current']['gust_kph'],
      humidity: json['current']['humidity'],
      uv: json['current']['uv'],
    );
  } else {
    return Weather(
      city: '',
      country: '',
      condition: 'Cant Get Location',
      codeImage: 0,
      temp: 0,
      windSpeed: 0,
      windDir: '-',
      pressure: 0,
      cloud: 0,
      feelsLike: 0,
      gust: 0,
      humidity: 0,
      uv: 0,
    );
  }
}
