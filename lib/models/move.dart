import 'package:flutterdex/models/version_group_detail.dart';

class Move {
  Move({
    required this.move,
    required this.versionGroupDetails,
  });

  MoveClass move;
  List<VersionGroupDetail> versionGroupDetails;

  factory Move.fromJson(Map<String, dynamic> json) => Move(
        move: MoveClass.fromJson(json["move"]),
        versionGroupDetails: List<VersionGroupDetail>.from(
            json["version_group_details"]
                .map((x) => VersionGroupDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "move": move.toJson(),
        "version_group_details":
            List<dynamic>.from(versionGroupDetails.map((x) => x.toJson())),
      };
}

class MoveClass {
  MoveClass({
    required this.name,
    required this.url,
  });

  String name;
  String url;

  factory MoveClass.fromJson(Map<String, dynamic> json) => MoveClass(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}
