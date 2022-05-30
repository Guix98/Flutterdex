import 'package:flutter/material.dart';
import 'package:flutterdex/models/flavor_text_entry.dart';

import 'package:get/get.dart';

import '../../controllers/pokedex_controller.dart';
import '../../utils/language_variants.dart';

class PokedexEntries extends StatefulWidget {
  const PokedexEntries(
      {Key? key,
      required PokedexController pokedexController,
      LanguageVariant languageVariant = LanguageVariant.eng})
      : _pokedexController = pokedexController,
        _languageVariant = languageVariant,
        super(key: key);
  final PokedexController _pokedexController;
  final LanguageVariant _languageVariant;

  @override
  State<PokedexEntries> createState() => _PokedexEntriesState();
}

class _PokedexEntriesState extends State<PokedexEntries> {
  @override
  Widget build(BuildContext context) {
    List<FlavorTextEntry> flavorsList =
        widget._pokedexController.descriptions.value;
    List<FlavorTextEntry> spFlavorsList =
        widget._pokedexController.spanishDescriptions.value;
    return widget._languageVariant == LanguageVariant.eng
        ? Expanded(
            child: ListView.builder(
            itemCount: flavorsList.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  'Pokémon ' + flavorsList[index].version.name.capitalize!,
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: const Icon(Icons.arrow_forward_ios_rounded),
                onTap: () {
                  Get.defaultDialog(
                      title:
                          'Entry from Pokémon ${flavorsList[index].version.name.capitalize!}',
                      content: Text(flavorsList[index].flavorText));
                },
              );
            },
          ))
        : Expanded(
            child: ListView.builder(
            itemCount: spFlavorsList.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  'Pokémon ' + spFlavorsList[index].version.name.capitalize!,
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: const Icon(Icons.arrow_forward_ios_rounded),
                onTap: () {
                  Get.defaultDialog(
                      title:
                          'Entrada de Pokémon ${spFlavorsList[index].version.name.capitalize!}',
                      content: Text(spFlavorsList[index].flavorText));
                },
              );
            },
          ));
  }
}
