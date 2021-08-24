import 'package:flutter/material.dart';
import 'package:rx_notifier/rx_notifier.dart';

class OrganizationController {
  var id = RxNotifier<String>("");
  var name = RxNotifier<String>("");
  var description = RxNotifier<String>("");
  var cep = RxNotifier<String>("");
  var state = RxNotifier<String>("");
  var city = RxNotifier<String>("");
  var neighborhood = RxNotifier<String>("");
  var street = RxNotifier<String>("");
  var number = RxNotifier<String>("");

  String get getId => id.value;
  String get getName => name.value;
  String get getDescription => description.value;
  String get getCep => cep.value;
  String get getState => state.value;
  String get getCity => city.value;
  String get getNeighborhood => neighborhood.value;
  String get getStreet => street.value;
  String get getNumber => number.value;

  var isLoading = RxNotifier<bool>(false);
  bool get getIsLoading => isLoading.value;

  void setId(String id) {
    this.id.value = id;
  }

  void setName(String name) {
    this.name.value = name;
  }

  void setDescription(String description) {
    this.description.value = description;
  }

  void setCep(String cep) {
    this.cep.value = cep;
  }

  void setState(String state) {
    this.state.value = state;
  }

  void setCity(String city) {
    this.city.value = city;
  }

  void setNeighborhood(String neighborhood) {
    this.neighborhood.value = neighborhood;
  }

  void setStreet(String street) {
    this.street.value = street;
  }

  void setNumber(String number) {
    this.number.value = number;
  }

  TextEditingController idEditingController = TextEditingController();
  TextEditingController nameEditingController = TextEditingController();
  TextEditingController descriptionEditingController = TextEditingController();
  TextEditingController cepEditingController = TextEditingController();
  TextEditingController stateEditingController = TextEditingController();
  TextEditingController cityEditingController = TextEditingController();
  TextEditingController neighborhoodEditingController = TextEditingController();
  TextEditingController streetEditingController = TextEditingController();
  TextEditingController numberEditingController = TextEditingController();

  String? validator(String value) {
    if (value.isEmpty) return "Campo vazio";
    if (value.length < 6) return "Campo muito pequeno";
    return null;
  }
}
