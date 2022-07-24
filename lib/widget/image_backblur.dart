import 'dart:ui';

import 'package:flutter/material.dart';

class BackgroundBlurImage extends StatelessWidget {
  const BackgroundBlurImage({
    Key? key,
    this.image,
  }) : super(key: key);

  final String? image;

  @override
  Widget build(BuildContext context) {
    double widthQuery = MediaQuery.of(context).size.width;
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Colors.yellow[700],
                radius: 35,
              ),
              const SizedBox(
                width: 40,
              ),
              CircleAvatar(
                backgroundColor: Colors.blue[300],
                radius: 35,
              ),
            ],
          ),
          ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 45, sigmaY: 45),
              child: Container(
                width: widthQuery,
                height: 240,
              ),
            ),
          ),
          image != null ? Container(
            width: 180,
            height: 180,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  image!,
                ),
              ),
            ),
          ) : Container(),
        ],
      ),
    );
  }
}
