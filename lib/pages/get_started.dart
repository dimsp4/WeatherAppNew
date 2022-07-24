import 'package:flutter/material.dart';

import '../widget/image_backblur.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double widthQuery = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const BackgroundBlurImage(
              image:
                  'assets/image/2682827_sun_cloud_day_light bolt_weather_rain_thunderstorm.png',
            ),
            const Text(
              "Discover the Weather\nin your City",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w600, fontSize: 25, letterSpacing: 1),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Get to know your weather maps and\nradar percipitation forecast",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w300, fontSize: 13, letterSpacing: 1),
            ),
            const SizedBox(
              height: 60,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Container(
                width: widthQuery,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'home');
                  },
                  child: const Text(
                    "Get Started",
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
