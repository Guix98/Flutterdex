import 'package:flutterdex/models/language.dart';

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
