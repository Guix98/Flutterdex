class Version {
  Version({
    required this.name,
    required this.url,
  });

  String name;
  String url;

  factory Version.fromJson(Map<String, dynamic> json) => Version(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}
