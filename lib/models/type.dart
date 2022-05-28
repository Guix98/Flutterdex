class Types {
  Types({
    required this.slot,
    required this.types,
  });

  int slot;
  TypesClass types;

  factory Types.fromJson(Map<String, dynamic> json) => Types(
        slot: json["slot"],
        types: TypesClass.fromJson(json["type"]),
      );

  Map<String, dynamic> toJson() => {
        "slot": slot,
        "types": types.toJson(),
      };
}

class TypesClass {
  TypesClass({
    required this.name,
    required this.url,
  });

  String name;
  String url;

  factory TypesClass.fromJson(Map<String, dynamic> json) => TypesClass(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}
