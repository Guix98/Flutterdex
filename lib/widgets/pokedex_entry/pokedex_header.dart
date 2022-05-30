import 'package:flutter/material.dart';
import 'package:flutterdex/controllers/pokedex_controller.dart';
import 'package:flutterdex/utils/language_variants.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../icons/pokeball.dart';

class PokedexHeader extends StatelessWidget {
  const PokedexHeader({
    Key? key,
    required PokedexController pokedexController,
    this.languageVariant = LanguageVariant.eng,
  })  : _pokedexController = pokedexController,
        super(key: key);

  final PokedexController _pokedexController;
  final LanguageVariant languageVariant;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        PokemonName(
            pokedexController: _pokedexController,
            languageVariant: languageVariant),
        PokedexNumber(pokedexController: _pokedexController)
      ],
    );
  }
}

class PokemonName extends StatelessWidget {
  const PokemonName(
      {Key? key,
      required PokedexController pokedexController,
      required this.languageVariant})
      : _pokedexController = pokedexController,
        super(key: key);
  final PokedexController _pokedexController;
  final LanguageVariant languageVariant;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(_pokedexController.getName.toString().toUpperCase(),
            style: GoogleFonts.chakraPetch(
                fontSize: 30, fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis),
        Text(
          languageVariant == LanguageVariant.eng
              ? _pokedexController.getGenus
              : _pokedexController.getSpanishGenus,
          style: GoogleFonts.changa(fontSize: 14),
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}

class PokedexNumber extends StatelessWidget {
  const PokedexNumber({
    Key? key,
    required PokedexController pokedexController,
  })  : _pokedexController = pokedexController,
        super(key: key);

  final PokedexController _pokedexController;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        PokeballIcon(),
        Container(
          height: 60,
          width: 60,
          child: FittedBox(
            fit: BoxFit.contain,
            child: Text(_pokedexController.getId,
                style: GoogleFonts.chakraPetch(fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis),
          ),
        ),
      ],
    );
  }
}
