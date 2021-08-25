class MapModel {
  late String id;
  late String name;
  late String source;
  late String description;

  MapModel();

  MapModel.fromJson(Map<String, dynamic> json) {
    this.id = json["id"] ?? "";
    this.name = json["name"];
    this.source = json["source"];
    this.description = json["description"];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = new Map<String, dynamic>();
    json["name"] = this.name;
    json["source"] = this.source;
    json["description"] = this.description;
    return json;
  }
}
