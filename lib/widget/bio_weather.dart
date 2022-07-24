import 'package:flutter/material.dart';

class BioWeather extends StatelessWidget {
  const BioWeather({
    Key? key,
    required this.image,
    required this.info,
    required this.name,
    required this.nightDaySwitch,
  }) : super(key: key);

  final String image, info, name;
  final bool nightDaySwitch;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          image,
          width: 45,
          height: 45,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          info,
          style: TextStyle(
            color: nightDaySwitch ? Colors.black : Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 15,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          name,
          style: TextStyle(
              color: nightDaySwitch ? Colors.black54 : Colors.white54,
              fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
