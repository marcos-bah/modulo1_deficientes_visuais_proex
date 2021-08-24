class BuilderModel {
  late String id;
  late String name;
  late double lat;
  late double lon;
  late String description;

  BuilderModel();

  BuilderModel.fromJson(Map<String, dynamic> json) {
    this.id = json["id"] ?? "";
    this.name = json["name"];
    this.lat = json["lat"];
    this.lon = json["lon"];
    this.description = json["description"];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = new Map<String, dynamic>();
    json["name"] = this.name;
    json["lat"] = this.lat;
    json["lon"] = this.lon;
    json["description"] = this.description;
    return json;
  }
}
