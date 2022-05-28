class EvolutionChain {
  EvolutionChain({
    required this.url,
  });

  String url;

  factory EvolutionChain.fromJson(Map<String, dynamic> json) => EvolutionChain(
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
      };
}
