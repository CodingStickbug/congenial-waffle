import 'package:flutter/material.dart';

// Hero widget (AKA background image that looks cool)

class HeroWidget extends StatelessWidget {
  const HeroWidget({super.key,});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Hero(
          tag: "hero1",
          child: ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(20.0),
            child: Image.asset(
              "assets/images/fnv.jpg",
              color: Color.fromARGB(129, 255, 153, 0),
              colorBlendMode: BlendMode.modulate,
            ),
          ),
        ),
      ],
    );
  }
}
