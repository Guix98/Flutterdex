import 'package:flutter/material.dart';

class PokedexBackground extends StatelessWidget {
  const PokedexBackground({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/pokeball_background.png'),
              repeat: ImageRepeat.repeat)),
    );
  }
}
