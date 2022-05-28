import 'package:flutter/material.dart';
import 'package:flutterdex/models/flavor_text_entry.dart';

import 'package:get/get.dart';

import '../../controllers/pokedex_controller.dart';

class PokedexEntries extends StatefulWidget {
  const PokedexEntries({Key? key, required PokedexController pokedexController})
      : _pokedexController = pokedexController,
        super(key: key);
  final PokedexController _pokedexController;

  @override
  State<PokedexEntries> createState() => _PokedexEntriesState();
}

class _PokedexEntriesState extends State<PokedexEntries> {
  @override
  Widget build(BuildContext context) {
    List<FlavorTextEntry> flavorsList =
        widget._pokedexController.descriptions.value;
    return Expanded(
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
    ));
  }
}
