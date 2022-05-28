import 'package:flutter/material.dart';
import 'package:flutterdex/controllers/pokedex_controller.dart';
import 'package:flutterdex/controllers/pokemon_search_controller.dart';
import 'package:flutterdex/models/national_pokedex.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/icons/pokeball.dart';

class PokemonSearchDelegate extends SearchDelegate {
  final PokemonSearchController _searchController =
      Get.put<PokemonSearchController>(PokemonSearchController());
  final PokedexController _pokedexController =
      Get.put<PokedexController>(PokedexController());

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(icon: const Icon(Icons.clear), onPressed: () => query = '')
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        icon: const Icon(Icons.arrow_back_ios), onPressed: () => Get.back());
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.trim().length == 0) {
      return searchList(_searchController.dex.value);
    }
    return searchList(_searchController.dex.value
        .where((element) => (element.entryNumber.toString().contains(query) |
            element.pokemonSpecies.name.contains(query)))
        .toList());
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return searchList(_searchController.dex.value);
  }

  ListView searchList(List<PokemonEntry> list) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          leading: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              PokeballIcon(
                width: 35,
              ),
              Container(
                height: 25,
                width: 25,
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Text(list[index].entryNumber.toString(),
                      style:
                          GoogleFonts.chakraPetch(fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis),
                ),
              ),
            ],
          ),
          title: Text('${list[index].pokemonSpecies.name.capitalizeFirst}'),
          onTap: () {
            _pokedexController.loadPokemon(list[index].entryNumber);
            Get.back();
          },
        );
      },
      itemCount: list.length,
    );
  }
}
