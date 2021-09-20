class MapModel {
  late String id;
  late String name;
  late String source;
  late String description;
  late String buildingId;

  MapModel({
    this.id = "",
    this.name = "",
    this.source = "",
    this.description = "",
    this.buildingId = "42b1a2c9-7813-439f-ad48-1a062553e97b",
  });

  MapModel.fromJson(Map<String, dynamic> json) {
    this.id = json["id"] ?? "";
    this.name = json["name"];
    this.source = json["source"];
    this.description = json["description"];
    this.buildingId = json["building_id"];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = new Map<String, dynamic>();
    json["name"] = this.name;
    json["source"] = this.source;
    json["description"] = this.description;
    json["building_id"] = this.buildingId;
    return json;
  }
}
