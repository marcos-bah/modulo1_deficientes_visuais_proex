import 'package:flutter/material.dart';
import 'package:rx_notifier/rx_notifier.dart';

class MapController {
  var id = RxNotifier<String>("");
  var name = RxNotifier<String>("");
  var source = RxNotifier<String>("");
  var description = RxNotifier<String>("");

  String get getId => id.value;
  String get getName => name.value;
  String get getSource => source.value;
  String get getDescription => description.value;

  var isLoading = RxNotifier<bool>(false);
  bool get getIsLoading => isLoading.value;

  void setId(String id) {
    this.id.value = id;
  }

  void setName(String name) {
    this.name.value = name;
  }

  void setSource(String source) {
    this.source.value = source;
  }

  void setDescription(String description) {
    this.description.value = description;
  }

  TextEditingController idEditingController = TextEditingController();
  TextEditingController nameEditingController = TextEditingController();
  TextEditingController sourceEditingController = TextEditingController();
  TextEditingController descriptionEditingController = TextEditingController();

  String? validator(String value) {
    if (value.isEmpty) return "Campo vazio";
    if (value.length < 6) return "Campo muito pequeno";
    return null;
  }
}
