import 'language.dart';

class Genus {
  Genus({
    required this.genus,
    required this.language,
  });

  String genus;
  Language language;

  factory Genus.fromJson(Map<String, dynamic> json) => Genus(
        genus: json["genus"],
        language: Language.fromJson(json["language"]),
      );

  Map<String, dynamic> toJson() => {
        "genus": genus,
        "language": language.toJson(),
      };
}
