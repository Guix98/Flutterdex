import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutterdex/models/flavor_text_entry.dart';
import 'package:flutterdex/models/language.dart';
import 'package:flutterdex/models/pokemon_species.dart';
import 'package:flutterdex/models/pokemon_stats.dart';
import 'package:flutterdex/models/version.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;

class PokedexController extends GetxController {
  @override
  Future<void> onInit() async {
    await loadPokemon(1);
    super.onInit();
  }

  final showLoadScreen = true.obs;

  Future<void> loadPokemon(dynamic pokedexNum) async {
    showLoadScreen.value = true;
    await getSpeciesById(pokedexNum);
    await getStatsById(pokedexNum);
    showLoadScreen.value = false;
  }

  final _id = ''.obs;
  get getId => this._id.value;
  set setId(value) => this._id.value = value;

  final _name = ''.obs;
  get getName => this._name.value;
  set setName(value) => this._name.value = value;

  final _genus = ''.obs;
  get getGenus => this._genus.value;
  set setGenus(value) => this._genus.value = value;

  final _firstType = ''.obs;
  get getFirstType => this._firstType.value;
  set setFirstType(value) => this._firstType.value = value;

  final _secondType = ''.obs;
  get getSecondType => this._secondType.value;
  set setSecondType(value) => this._secondType.value = value;

  final _imageurl = dotenv.env['SUBSTITUTE_IMAGE_URL'].obs;
  get getImageUrl => this._imageurl.value;
  set setImageUrl(value) => this._imageurl.value = value;

  final _hp = 0.obs;
  get getHp => this._hp.value;
  set setHp(value) => this._hp.value = value;

  final _attack = 0.obs;
  get getAttack => this._attack.value;
  set setAttack(value) => this._attack.value = value;

  final _defense = 0.obs;
  get getDefense => this._defense.value;
  set setDefense(value) => this._defense.value = value;

  final _specialAttack = 0.obs;
  get getSpecialAttack => this._specialAttack.value;
  set setSpecialAttack(value) => this._specialAttack.value = value;

  final _specialDefense = 0.obs;
  get getSpecialDefense => this._specialDefense.value;
  set setSpecialDefense(value) => this._specialDefense.value = value;

  final _speed = 0.obs;
  get getSpeed => this._speed.value;
  set setSpeed(value) => this._speed.value = value;

  final RxList<FlavorTextEntry> descriptions = [
    FlavorTextEntry(
        flavorText: 'flavorText',
        language: Language(name: 'name', url: 'url'),
        version: Version(name: 'name', url: 'url'))
  ].obs;
  get getDescription => this.descriptions.value;
  set setDescription(value) => this.descriptions.value = value;

  Future<void> getSpeciesById(dynamic pokedexNum) async {
    String url = dotenv.env['BASE_URL']! + 'pokemon-species/$pokedexNum/';
    final response = await http.get(Uri.parse(url));
    PokemonSpecies species = pokemonSpeciesFromJson(response.body);
    List<FlavorTextEntry> auxFlavors = species.flavorTextEntries
        .where((description) => description.language.name == "en")
        .toList();
    _id.value = species.id.toString();
    _name.value = species.name.capitalizeFirst!;
    _genus.value = species.genera
        .where((element) => element.language.name == "en")
        .first
        .genus
        .capitalize!;
    descriptions.value = fixDescriptions(auxFlavors);
  }

  List<FlavorTextEntry> fixDescriptions(List<FlavorTextEntry> originalFlavors) {
    List<FlavorTextEntry> descirptions = [];
    for (var flavor in originalFlavors) {
      String fixedDescription = flavor.flavorText.replaceAll("\n", " ");
      fixedDescription = fixedDescription.replaceAll("\f", " ");
      fixedDescription = fixedDescription.capitalizeFirst!;
      FlavorTextEntry flavorTextEntry = FlavorTextEntry(
          flavorText: fixedDescription,
          language: flavor.language,
          version: flavor.version);

      descirptions.add(flavorTextEntry);
    }
    return descirptions;
  }

  Future<void> getStatsById(dynamic pokedexNum) async {
    List<FlavorTextEntry> descirptions = [];
    String url = dotenv.env['BASE_URL']! + 'pokemon/$pokedexNum/';
    final response = await http.get(Uri.parse(url));
    PokemonStats stats = pokemonStatsFromJson(response.body);
    _firstType.value = stats.types.first.types.name.capitalizeFirst!;
    if (stats.types.length > 1) {
      _secondType.value = stats.types[1].types.name.capitalizeFirst!;
    } else {
      _secondType.value = '';
    }
    _imageurl.value = stats.sprites.other.officialArtwork.frontDefault;

    _hp.value = stats.stats
        .where((element) => element.stat.name == "hp")
        .first
        .baseStat;

    _attack.value = stats.stats
        .where((element) => element.stat.name == "attack")
        .first
        .baseStat;

    _defense.value = stats.stats
        .where((element) => element.stat.name == "defense")
        .first
        .baseStat;

    _specialAttack.value = stats.stats
        .where((element) => element.stat.name == "special-attack")
        .first
        .baseStat;

    _specialDefense.value = stats.stats
        .where((element) => element.stat.name == "special-defense")
        .first
        .baseStat;

    _speed.value = stats.stats
        .where((element) => element.stat.name == "speed")
        .first
        .baseStat;
  }
}
