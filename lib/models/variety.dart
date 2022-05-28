import 'package:flutterdex/models/pokemon.dart';

class Variety {
  Variety({
    required this.isDefault,
    required this.pokemon,
  });

  bool isDefault;
  Pokemon pokemon;

  factory Variety.fromJson(Map<String, dynamic> json) => Variety(
        isDefault: json["is_default"],
        pokemon: Pokemon.fromJson(json["pokemon"]),
      );

  Map<String, dynamic> toJson() => {
        "is_default": isDefault,
        "pokemon": pokemon.toJson(),
      };
}
