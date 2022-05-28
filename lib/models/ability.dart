class Ability {
  Ability({
    required this.name,
    required this.url,
  });

  String name;
  String url;

  factory Ability.fromJson(Map<String, dynamic> json) => Ability(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}
