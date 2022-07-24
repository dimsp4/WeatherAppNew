import 'package:flutter/material.dart';

class BioInfoWeather extends StatelessWidget {
  const BioInfoWeather({
    Key? key,
    required this.image,
    required this.name,
    required this.status,
    this.statusPlus, required this.nightDaySwitch,
  }) : super(key: key);

  final String image, name, status;
  final bool nightDaySwitch;
  final String? statusPlus;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Image.asset(
            image,
            width: 30,
            height: 30,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(name, style: TextStyle(color: nightDaySwitch ? Colors.black : Colors.white),),
          const Spacer(),
          Text(statusPlus != null ? status + statusPlus! : status, style: TextStyle(color: nightDaySwitch ? Colors.black : Colors.white)),
        ],
      ),
    );
  }
}