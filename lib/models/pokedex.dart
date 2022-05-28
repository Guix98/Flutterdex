class Pokedex {
  Pokedex({
    required this.name,
    required this.url,
  });

  String name;
  String url;

  factory Pokedex.fromJson(Map<String, dynamic> json) => Pokedex(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}
