import 'dart:convert';

Areas areasFromJson(String str) => Areas.fromJson(json.decode(str));

String areasToJson(Areas data) => json.encode(data.toJson());

class Areas {

  List<Area> areas;

  Areas({
    required this.areas,
  });



  factory Areas.fromJson(Map<String, dynamic> json) => Areas(
    areas: List<Area>.from(json["areas"].map((x) => Area.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "areas": List<dynamic>.from(areas.map((x) => x.toJson())),
  };
}

class Area {
  Area({
    this.name,
    this.url,
  });

  String? name;
  String? url;

  factory Area.fromJson(Map<String, dynamic> json) => Area(
    name: json["name"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "url": url,
  };
}