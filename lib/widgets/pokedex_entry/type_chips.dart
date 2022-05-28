import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/pokedex_controller.dart';
import '../../theme/colors.dart';

class TypeChips extends StatelessWidget {
  const TypeChips({
    Key? key,
    required PokedexController pokedexController,
  })  : _pokedexController = pokedexController,
        super(key: key);

  final PokedexController _pokedexController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Chip(
          label: Container(
              width: Get.width * 0.1,
              child: Container(
                  width: Get.width * 0.1,
                  height: 25,
                  child: FittedBox(
                      fit: BoxFit.contain,
                      child: Text(_pokedexController.getFirstType)))),
          backgroundColor: typeChipColor(_pokedexController.getFirstType),
        ),
        Chip(
          label: Container(
              width: Get.width * 0.1,
              child: Container(
                  width: Get.width * 0.1,
                  height: 25,
                  child: FittedBox(
                      fit: BoxFit.contain,
                      child: Text(_pokedexController.getSecondType)))),
          backgroundColor: typeChipColor(_pokedexController.getSecondType),
        ),
      ],
    );
  }

  Color typeChipColor(String type) {
    switch (type) {
      case 'Bug':
        return bugTypeColor;

      case 'Dark':
        return darkTypeColor;

      case 'Dragon':
        return dragonTypeColor;

      case 'Electric':
        return electricTypeColor;

      case 'Fairy':
        return fairyTypeColor;

      case 'Fighting':
        return fightingTypeColor;

      case 'Fire':
        return fireTypeColor;

      case 'Flying':
        return flyingTypeColor;

      case 'Ghost':
        return ghostTypeColor;

      case 'Grass':
        return grassTypeColor;

      case 'Ground':
        return groundTypeColor;

      case 'Ice':
        return iceTypeColor;

      case 'Normal':
        return normalTypeColor;

      case 'Poison':
        return poisonTypeColor;

      case 'Psychic':
        return psychicTypeColor;

      case 'Rock':
        return rockTypeColor;

      case 'Steel':
        return steelTypeColor;

      case 'Water':
        return waterTypeColor;

      case '':
        return Colors.transparent;
    }
    return Colors.white;
  }
}
