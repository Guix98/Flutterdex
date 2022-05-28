import 'dart:convert';

import 'package:flutterdex/models/language.dart';
import 'package:flutterdex/models/pokemon.dart';

NationalPokedex nationalPokedexFromJson(String str) =>
    NationalPokedex.fromJson(json.decode(str));

String nationalPokedexToJson(NationalPokedex data) =>
    json.encode(data.toJson());

class NationalPokedex {
  NationalPokedex({
    required this.descriptions,
    required this.id,
    required this.isMainSeries,
    required this.name,
    required this.names,
    required this.pokemonEntries,
    required this.region,
    required this.versionGroups,
  });

  List<Description> descriptions;
  int id;
  bool isMainSeries;
  String name;
  List<Name> names;
  List<PokemonEntry> pokemonEntries;
  dynamic region;
  List<dynamic> versionGroups;

  factory NationalPokedex.fromJson(Map<String, dynamic> json) =>
      NationalPokedex(
        descriptions: List<Description>.from(
            json["descriptions"].map((x) => Description.fromJson(x))),
        id: json["id"],
        isMainSeries: json["is_main_series"],
        name: json["name"],
        names: List<Name>.from(json["names"].map((x) => Name.fromJson(x))),
        pokemonEntries: List<PokemonEntry>.from(
            json["pokemon_entries"].map((x) => PokemonEntry.fromJson(x))),
        region: json["region"],
        versionGroups: List<dynamic>.from(json["version_groups"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "descriptions": List<dynamic>.from(descriptions.map((x) => x.toJson())),
        "id": id,
        "is_main_series": isMainSeries,
        "name": name,
        "names": List<dynamic>.from(names.map((x) => x.toJson())),
        "pokemon_entries":
            List<dynamic>.from(pokemonEntries.map((x) => x.toJson())),
        "region": region,
        "version_groups": List<dynamic>.from(versionGroups.map((x) => x)),
      };
}

class Description {
  Description({
    required this.description,
    required this.language,
  });

  String description;
  Language language;

  factory Description.fromJson(Map<String, dynamic> json) => Description(
        description: json["description"],
        language: Language.fromJson(json["language"]),
      );

  Map<String, dynamic> toJson() => {
        "description": description,
        "language": language.toJson(),
      };
}

class Name {
  Name({
    required this.language,
    required this.name,
  });

  Language language;
  String name;

  factory Name.fromJson(Map<String, dynamic> json) => Name(
        language: Language.fromJson(json["language"]),
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "language": language.toJson(),
        "name": name,
      };
}

class PokemonEntry {
  PokemonEntry({
    required this.entryNumber,
    required this.pokemonSpecies,
  });

  int entryNumber;
  Pokemon pokemonSpecies;

  factory PokemonEntry.fromJson(Map<String, dynamic> json) => PokemonEntry(
        entryNumber: json["entry_number"],
        pokemonSpecies: Pokemon.fromJson(json["pokemon_species"]),
      );

  Map<String, dynamic> toJson() => {
        "entry_number": entryNumber,
        "pokemon_species": pokemonSpecies.toJson(),
      };
}
