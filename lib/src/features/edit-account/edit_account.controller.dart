import 'package:flutter/material.dart';
import 'package:rx_notifier/rx_notifier.dart';

class EditAccountController {
  EditAccountController({required String id}) {
    //function get data from database
    Map<String, dynamic> data = {
      "name": "Marcos Barbosa",
      "email": "marcos.ssrv@gmail.com",
    };
    emailEditingController.text = data["email"];
    nameEditingController.text = data["name"];
  }
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController nameEditingController = TextEditingController();

  RxNotifier<bool> isLoading = RxNotifier<bool>(false);
  bool get getIsLoading => isLoading.value;

  void clear() {
    emailEditingController.clear();
    nameEditingController.clear();
  }
}
