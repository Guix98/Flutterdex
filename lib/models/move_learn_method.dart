class MoveLearnMethod {
  MoveLearnMethod({
    required this.name,
    required this.url,
  });

  String name;
  String url;

  factory MoveLearnMethod.fromJson(Map<String, dynamic> json) =>
      MoveLearnMethod(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}
