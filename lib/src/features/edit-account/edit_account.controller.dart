import 'package:flutter/material.dart';
import 'package:rx_notifier/rx_notifier.dart';

class EditAccountController {
  EditAccountController() {
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
  TextEditingController passwordEditingController = TextEditingController();
  TextEditingController newPasswordEditingController = TextEditingController();

  RxNotifier<bool> isLoading = RxNotifier<bool>(false);
  bool get getIsLoading => isLoading.value;
  RxNotifier<bool> isVisible = RxNotifier<bool>(false);
  bool get getIsVisible => isVisible.value;

  void clear() {
    emailEditingController.clear();
    nameEditingController.clear();
    passwordEditingController.clear();
    newPasswordEditingController.clear();
  }
}
