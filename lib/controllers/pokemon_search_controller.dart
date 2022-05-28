import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutterdex/models/national_pokedex.dart';
import 'package:flutterdex/models/pokemon.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;

class PokemonSearchController extends GetxController {
  @override
  Future<void> onInit() async {
    await getNationalDex();
    super.onInit();
  }

  final RxList<PokemonEntry> dex = [
    PokemonEntry(
        entryNumber: 0, pokemonSpecies: Pokemon(name: 'name', url: 'url'))
  ].obs;

  Future<void> getNationalDex() async {
    String url = dotenv.env['BASE_URL']! + 'pokedex/1';
    final response = await http.get(Uri.parse(url));
    NationalPokedex _nationalPokedex = nationalPokedexFromJson(response.body);
    dex.value = _nationalPokedex.pokemonEntries;
  }
}
