class Color {
  Color({
    required this.name,
    required this.url,
  });

  String name;
  String url;

  factory Color.fromJson(Map<String, dynamic> json) => Color(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}
