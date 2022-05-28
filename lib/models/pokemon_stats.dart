// To parse this JSON data, do
//
//     final pokemonStats = pokemonStatsFromJson(jsonString);

import 'dart:convert';

import 'package:flutterdex/models/ability_element.dart';
import 'package:flutterdex/models/move.dart';
import 'package:flutterdex/models/sprites.dart';
import 'package:flutterdex/models/stat.dart';
import 'package:flutterdex/models/type.dart';

PokemonStats pokemonStatsFromJson(String str) =>
    PokemonStats.fromJson(json.decode(str));

String pokemonStatsToJson(PokemonStats data) => json.encode(data.toJson());

class PokemonStats {
  PokemonStats({
    required this.abilities,
    required this.baseExperience,
    required this.height,
    required this.id,
    required this.moves,
    required this.name,
    required this.sprites,
    required this.stats,
    required this.types,
    required this.weight,
  });

  List<AbilityElement> abilities;
  int baseExperience;
  int height;
  int id;
  List<Move> moves;
  String name;
  Sprites sprites;
  List<Stat> stats;
  List<Types> types;
  int weight;

  factory PokemonStats.fromJson(Map<String, dynamic> json) => PokemonStats(
        abilities: List<AbilityElement>.from(
            json["abilities"].map((x) => AbilityElement.fromJson(x))),
        baseExperience: json["base_experience"],
        height: json["height"],
        id: json["id"],
        moves: List<Move>.from(json["moves"].map((x) => Move.fromJson(x))),
        name: json["name"],
        sprites: Sprites.fromJson(json["sprites"]),
        stats: List<Stat>.from(json["stats"].map((x) => Stat.fromJson(x))),
        types: List<Types>.from(json["types"].map((x) => Types.fromJson(x))),
        weight: json["weight"],
      );

  Map<String, dynamic> toJson() => {
        "abilities": List<dynamic>.from(abilities.map((x) => x.toJson())),
        "base_experience": baseExperience,
        "height": height,
        "id": id,
        "moves": List<dynamic>.from(moves.map((x) => x.toJson())),
        "name": name,
        "sprites": sprites.toJson(),
        "stats": List<dynamic>.from(stats.map((x) => x.toJson())),
        "types": List<dynamic>.from(types.map((x) => x.toJson())),
        "weight": weight,
      };
}
