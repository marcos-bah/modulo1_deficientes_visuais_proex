import 'package:flutter/material.dart';
import 'package:rx_notifier/rx_notifier.dart';

class BuilderController {
  var id = RxNotifier<String>("");
  var name = RxNotifier<String>("");
  var lat = RxNotifier<double>(0.0);
  var lon = RxNotifier<double>(0.0);
  var description = RxNotifier<String>("");

  String get getId => id.value;
  String get getName => name.value;
  double get getLat => lat.value;
  double get getLon => lon.value;
  String get getDescription => description.value;

  var isLoading = RxNotifier<bool>(false);
  bool get getIsLoading => isLoading.value;

  void setId(String id) {
    this.id.value = id;
  }

  void setName(String name) {
    this.name.value = name;
  }

  void setLat(String lat) {
    this.lat.value = double.tryParse(lat) ?? 0.0;
  }

  void setLon(String lon) {
    this.lon.value = double.tryParse(lon) ?? 0.0;
  }

  void setDescription(String description) {
    this.description.value = description;
  }

  TextEditingController idEditingController = TextEditingController();
  TextEditingController nameEditingController = TextEditingController();
  TextEditingController latEditingController = TextEditingController();
  TextEditingController lonEditingController = TextEditingController();
  TextEditingController descriptionEditingController = TextEditingController();

  String? validator(String value) {
    if (value.isEmpty) return "Campo vazio";
    if (value.length < 6) return "Campo muito pequeno";
    return null;
  }
}
