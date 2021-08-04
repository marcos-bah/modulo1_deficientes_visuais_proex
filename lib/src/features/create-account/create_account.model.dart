class CreateAccountModel {
  late String name;
  late String email;
  late String password;
  late String permission;

  CreateAccountModel(this.name, this.email, this.password, this.permission);

  CreateAccountModel.fromJson(Map<String, dynamic> json) {
    this.name = json["name"].toString();
    this.email = json["email"].toString();
    this.password = json["password"].toString();
    this.permission = json["permission"].toString();
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = new Map<String, dynamic>();
    json["name"] = this.name;
    json["email"] = this.email;
    json["password"] = this.password;
    json["permission"] = this.permission;
    return json;
  }
}
