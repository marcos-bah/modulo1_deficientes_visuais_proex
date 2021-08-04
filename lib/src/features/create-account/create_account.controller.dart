import 'package:flutter/material.dart';
import 'package:rx_notifier/rx_notifier.dart';

class CreateAccountController {
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController nameEditingController = TextEditingController();
  TextEditingController passwordEditingController =
      TextEditingController(text: "proex123");

  var permission = RxNotifier<String>("normal");
  String get getPermission => permission.value;

  RxNotifier<bool> isLoading = RxNotifier<bool>(false);
  bool get getIsLoading => isLoading.value;
}
