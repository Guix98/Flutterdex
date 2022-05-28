import 'dart:convert';

import 'package:flutterdex/models/color.dart';
import 'package:flutterdex/models/evolution_chain.dart';
import 'package:flutterdex/models/flavor_text_entry.dart';
import 'package:flutterdex/models/pokedex_number.dart';
import 'package:flutterdex/models/variety.dart';

import 'genus.dart';

PokemonSpecies pokemonSpeciesFromJson(String str) =>
    PokemonSpecies.fromJson(json.decode(str));

String pokemonSpeciesToJson(PokemonSpecies data) => json.encode(data.toJson());

class PokemonSpecies {
  PokemonSpecies({
    required this.color,
    required this.eggGroups,
    required this.evolutionChain,
    required this.flavorTextEntries,
    required this.genera,
    required this.habitat,
    required this.hasGenderDifferences,
    required this.id,
    required this.name,
    required this.order,
    required this.pokedexNumbers,
    required this.varieties,
  });

  Color color;
  List<Color> eggGroups;
  EvolutionChain evolutionChain;

  List<FlavorTextEntry> flavorTextEntries;
  List<Genus> genera;

  dynamic habitat;
  bool hasGenderDifferences;
  int id;
  String name;
  int order;
  List<PokedexNumber> pokedexNumbers;
  List<Variety> varieties;

  factory PokemonSpecies.fromJson(Map<String, dynamic> json) => PokemonSpecies(
        color: Color.fromJson(json["color"]),
        eggGroups:
            List<Color>.from(json["egg_groups"].map((x) => Color.fromJson(x))),
        evolutionChain: EvolutionChain.fromJson(json["evolution_chain"]),
        flavorTextEntries: List<FlavorTextEntry>.from(
            json["flavor_text_entries"]
                .map((x) => FlavorTextEntry.fromJson(x))),
        genera: List<Genus>.from(json["genera"].map((x) => Genus.fromJson(x))),
        habitat: json["habitat"],
        hasGenderDifferences: json["has_gender_differences"],
        id: json["id"],
        name: json["name"],
        order: json["order"],
        pokedexNumbers: List<PokedexNumber>.from(
            json["pokedex_numbers"].map((x) => PokedexNumber.fromJson(x))),
        varieties: List<Variety>.from(
            json["varieties"].map((x) => Variety.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "color": color.toJson(),
        "egg_groups": List<dynamic>.from(eggGroups.map((x) => x.toJson())),
        "evolution_chain": evolutionChain.toJson(),
        "flavor_text_entries":
            List<dynamic>.from(flavorTextEntries.map((x) => x.toJson())),
        "genera": List<dynamic>.from(genera.map((x) => x.toJson())),
        "habitat": habitat,
        "has_gender_differences": hasGenderDifferences,
        "id": id,
        "name": name,
        "order": order,
        "pokedex_numbers":
            List<dynamic>.from(pokedexNumbers.map((x) => x.toJson())),
        "varieties": List<dynamic>.from(varieties.map((x) => x.toJson())),
      };
}
