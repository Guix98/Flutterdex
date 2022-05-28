class Language {
  Language({
    required this.name,
    required this.url,
  });

  String name;
  String url;

  factory Language.fromJson(Map<String, dynamic> json) => Language(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}
