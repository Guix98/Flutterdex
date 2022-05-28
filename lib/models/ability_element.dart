import 'package:flutterdex/models/ability.dart';

class AbilityElement {
  AbilityElement({
    required this.ability,
    required this.isHidden,
    required this.slot,
  });

  Ability ability;
  bool isHidden;
  int slot;

  factory AbilityElement.fromJson(Map<String, dynamic> json) => AbilityElement(
        ability: Ability.fromJson(json["ability"]),
        isHidden: json["is_hidden"],
        slot: json["slot"],
      );

  Map<String, dynamic> toJson() => {
        "ability": ability.toJson(),
        "is_hidden": isHidden,
        "slot": slot,
      };
}
