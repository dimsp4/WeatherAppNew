import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:intl/intl.dart';
import 'package:testinggg/functional/image_api_function.dart';
import 'package:testinggg/model/weather_model.dart';
import 'package:testinggg/widget/image_backblur.dart';
import 'package:shimmer/shimmer.dart';

import '../widget/bio_info.dart';
import '../widget/bio_weather.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController controllerKota = TextEditingController(text: "Jakarta");
  bool nightDaySwitch = false;
  @override
  void initState() {
    super.initState();
    getWeather(controllerKota.text);
  }

  @override
  Widget build(BuildContext context) {
    double widthQuery = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: nightDaySwitch ? Colors.white : Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 25,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          DateFormat('d, MMM y').format(DateTime.now()),
                          style: TextStyle(
                            color: nightDaySwitch ? Colors.black : Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        FutureBuilder(
                          future: getWeather(controllerKota.text),
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            if (snapshot.hasData) {
                              return Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.location_on_rounded,
                                    color: nightDaySwitch
                                        ? Colors.black
                                        : Colors.white,
                                    size: 21,
                                  ),
                                  Text(
                                    snapshot.data.city + ", ",
                                    style: TextStyle(
                                      color: nightDaySwitch
                                          ? Colors.black
                                          : Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 130,
                                    child: Text(
                                      snapshot.data.country,
                                      style: TextStyle(
                                          overflow: TextOverflow.ellipsis,
                                          color: nightDaySwitch
                                              ? Colors.black54
                                              : Colors.white60,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16),
                                    ),
                                  )
                                ],
                              );
                            } else {
                              return Row(
                                children: [
                                  Icon(
                                    Icons.location_on_rounded,
                                    color: nightDaySwitch
                                        ? Colors.black
                                        : Colors.white,
                                    size: 21,
                                  ),
                                  Shimmer.fromColors(
                                    baseColor: Colors.white,
                                    highlightColor: Colors.black,
                                    child: Container(
                                      width: 100,
                                      height: 10,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              );
                            }
                          },
                        )
                      ],
                    ),
                    FlutterSwitch(
                      width: 80,
                      height: 45.0,
                      toggleSize: 28.0,
                      value: nightDaySwitch,
                      borderRadius: 30.0,
                      padding: 8.0,
                      activeSwitchBorder: Border.all(
                        color: Colors.black,
                      ),
                      inactiveSwitchBorder: Border.all(
                        color: nightDaySwitch ? Colors.black : Colors.white,
                      ),
                      activeToggleColor: Colors.yellow,
                      inactiveToggleColor: Colors.blueGrey,
                      activeColor: Colors.transparent,
                      inactiveColor: Colors.transparent,
                      activeIcon: Image.asset(
                          'assets/image/2682848_day_forecast_sun_sunny_weather_icon.png'),
                      inactiveIcon: Image.asset(
                          'assets/image/2682847_eclipse_forecast_moon_night_space_icon.png'),
                      onToggle: (val) {
                        setState(() {
                          nightDaySwitch = val;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                FutureBuilder(
                    future: getWeather(controllerKota.text),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      return SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: TextField(
                          controller: controllerKota,
                          onSubmitted: (value) {
                            setState(() {});
                          },
                          style: TextStyle(
                              color:
                                  nightDaySwitch ? Colors.black : Colors.white),
                          decoration: InputDecoration(
                            suffixIcon: Icon(
                              Icons.search,
                              color:
                                  nightDaySwitch ? Colors.black : Colors.white,
                            ),
                            labelText: 'Enter City',
                            labelStyle: TextStyle(
                              color:
                                  nightDaySwitch ? Colors.black : Colors.white,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1,
                                  color: nightDaySwitch
                                      ? Colors.black54
                                      : Colors.white),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1,
                                  color: nightDaySwitch
                                      ? Colors.black54
                                      : Colors.white),
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                      );
                    }),
                FutureBuilder(
                  future: getWeather(controllerKota.text),
                  builder: ((BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        children: [
                          BackgroundBlurImage(
                            image: getImage(snapshot.data.codeImage),
                          ),
                          Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  snapshot.data.condition,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: nightDaySwitch
                                          ? Colors.black
                                          : Colors.white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const SizedBox(
                                      width: 31,
                                    ),
                                    Text(
                                      snapshot.data.temp.toStringAsFixed(0),
                                      style: TextStyle(
                                        color: nightDaySwitch
                                            ? Colors.black
                                            : Colors.white,
                                        fontSize: 60,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Text(
                                      "\u00B0",
                                      style: TextStyle(
                                        fontSize: 60,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.blue[200],
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      );
                    } else {
                      return Shimmer.fromColors(
                        baseColor: Colors.white,
                        highlightColor: Colors.black,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 240,
                              child: Image.asset(
                                'assets/image/2682850_weather_clouds_cloud_cloudy_forecast.png',
                                width: 180,
                                height: 180,
                              ),
                            ),
                            Center(
                              child: Column(
                                children: [
                                  Container(
                                    width: 100,
                                    height: 5,
                                    color: Colors.white,
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const SizedBox(
                                        width: 31,
                                      ),
                                      Text(
                                        "--",
                                        style: TextStyle(
                                          color: nightDaySwitch
                                              ? Colors.black
                                              : Colors.white,
                                          fontSize: 60,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Text(
                                        "\u00B0",
                                        style: TextStyle(
                                          fontSize: 60,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.blue[200],
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                  }),
                ),
                const SizedBox(
                  height: 50,
                ),
                FutureBuilder(
                    future: getWeather(controllerKota.text),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            BioWeather(
                              image:
                                  'assets/image/2682842_weather_wind_speed_fast_breeze_windy.png',
                              info: snapshot.data.windSpeed.toStringAsFixed(0) +
                                  " km/h",
                              name: 'Wind',
                              nightDaySwitch: nightDaySwitch,
                            ),
                            BioWeather(
                              image: 'assets/image/meter.png',
                              info: snapshot.data.pressure.toStringAsFixed(0),
                              name: 'Pressure',
                              nightDaySwitch: nightDaySwitch,
                            ),
                            BioWeather(
                              image:
                                  'assets/image/2682807_rain_high_weather_percentage_precipitation_drop_humidity.png',
                              info: snapshot.data.humidity.toString(),
                              name: 'Humidity',
                              nightDaySwitch: nightDaySwitch,
                            ),
                          ],
                        );
                      } else {
                        return Shimmer.fromColors(
                          baseColor: Colors.white,
                          highlightColor: Colors.black,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              BioWeather(
                                image:
                                    'assets/image/2682842_weather_wind_speed_fast_breeze_windy.png',
                                info: '...',
                                name: 'Wind',
                                nightDaySwitch: nightDaySwitch,
                              ),
                              BioWeather(
                                image: 'assets/image/meter.png',
                                info: '...',
                                name: 'Pressure',
                                nightDaySwitch: nightDaySwitch,
                              ),
                              BioWeather(
                                image:
                                    'assets/image/2682807_rain_high_weather_percentage_precipitation_drop_humidity.png',
                                info: '...',
                                name: 'Humidity',
                                nightDaySwitch: nightDaySwitch,
                              ),
                            ],
                          ),
                        );
                      }
                    }),
                const SizedBox(
                  height: 40,
                ),
                Text(
                  "More Info",
                  style: TextStyle(
                    color: nightDaySwitch ? Colors.black : Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                FutureBuilder(
                    future: getWeather(controllerKota.text),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        return SizedBox(
                          width: widthQuery,
                          child: Column(
                            children: [
                              BioInfoWeather(
                                image:
                                    'assets/image/2682830_celsius_weather_degrees_forecast_temperature.png',
                                name: 'Feels like',
                                status: snapshot.data.feelsLike.toString(),
                                nightDaySwitch: nightDaySwitch,
                              ),
                              Divider(
                                color: nightDaySwitch
                                    ? Colors.black.withOpacity(0.6)
                                    : Colors.white.withOpacity(0.6),
                              ),
                              BioInfoWeather(
                                image:
                                    'assets/image/2682806_uv_radiation_weather_ultraviolet_sun_rays_light.png',
                                name: 'Index',
                                status: snapshot.data.uv.toString(),
                                nightDaySwitch: nightDaySwitch,
                              ),
                              Divider(
                                color: nightDaySwitch
                                    ? Colors.black.withOpacity(0.6)
                                    : Colors.white.withOpacity(0.6),
                              ),
                              BioInfoWeather(
                                image:
                                    'assets/image/2682810_weather_direction_catcher_flag_windy_wind.png',
                                name: 'Wind Direction',
                                status: snapshot.data.windDir,
                                nightDaySwitch: nightDaySwitch,
                              ),
                              Divider(
                                color: nightDaySwitch
                                    ? Colors.black.withOpacity(0.6)
                                    : Colors.white.withOpacity(0.6),
                              ),
                              BioInfoWeather(
                                image:
                                    'assets/image/2682842_weather_wind_speed_fast_breeze_windy.png',
                                name: 'Gust',
                                status: snapshot.data.gust.toString(),
                                nightDaySwitch: nightDaySwitch,
                              ),
                              Divider(
                                color: nightDaySwitch
                                    ? Colors.black.withOpacity(0.6)
                                    : Colors.white.withOpacity(0.6),
                              ),
                              BioInfoWeather(
                                image:
                                    'assets/image/2682850_weather_clouds_cloud_cloudy_forecast.png',
                                name: 'Cloud',
                                status: snapshot.data.cloud.toString(),
                                statusPlus: ' %',
                                nightDaySwitch: nightDaySwitch,
                              ),
                            ],
                          ),
                        );
                      } else {
                        return Shimmer.fromColors(
                          baseColor: Colors.white,
                          highlightColor: Colors.black,
                          child: SizedBox(
                            width: widthQuery,
                            child: Column(
                              children: [
                                BioInfoWeather(
                                  image:
                                      'assets/image/2682830_celsius_weather_degrees_forecast_temperature.png',
                                  name: 'Feels like',
                                  status: '35.0',
                                  nightDaySwitch: nightDaySwitch,
                                ),
                                Divider(
                                  color: nightDaySwitch
                                      ? Colors.black
                                      : Colors.white.withOpacity(0),
                                ),
                                BioInfoWeather(
                                  image:
                                      'assets/image/2682806_uv_radiation_weather_ultraviolet_sun_rays_light.png',
                                  name: 'Index',
                                  status: '8.0',
                                  nightDaySwitch: nightDaySwitch,
                                ),
                                Divider(
                                  color: nightDaySwitch
                                      ? Colors.black54
                                      : Colors.white54,
                                ),
                                BioInfoWeather(
                                  image:
                                      'assets/image/2682810_weather_direction_catcher_flag_windy_wind.png',
                                  name: 'Wind Direction',
                                  status: 'ESE',
                                  nightDaySwitch: nightDaySwitch,
                                ),
                                Divider(
                                  color: nightDaySwitch
                                      ? Colors.black54
                                      : Colors.white54,
                                ),
                                BioInfoWeather(
                                  image:
                                      'assets/image/2682842_weather_wind_speed_fast_breeze_windy.png',
                                  name: 'Gust',
                                  status: '18.0',
                                  nightDaySwitch: nightDaySwitch,
                                ),
                                Divider(
                                  color: nightDaySwitch
                                      ? Colors.black54
                                      : Colors.white54,
                                ),
                                BioInfoWeather(
                                  image:
                                      'assets/image/2682850_weather_clouds_cloud_cloudy_forecast.png',
                                  name: 'Cloud',
                                  status: '32',
                                  statusPlus: ' %',
                                  nightDaySwitch: nightDaySwitch,
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                    }),
                const SizedBox(
                  height: 40,
                ),
                Center(
                  child: Text(
                    "Copyright © weatherapi.com",
                    style: TextStyle(
                        color:
                            nightDaySwitch ? Colors.black54 : Colors.white54),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
