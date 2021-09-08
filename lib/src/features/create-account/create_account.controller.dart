import 'package:flutter/material.dart';
import 'package:modulo1_deficientes_visuais_proex/src/features/shared/user.model.dart';
import 'package:rx_notifier/rx_notifier.dart';

class CreateAccountController {
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController nameEditingController = TextEditingController();
  TextEditingController passwordEditingController =
      TextEditingController(text: "proex123");

  var permission = RxNotifier<String>("NORMAL");
  String get getPermission => permission.value;

  RxNotifier<bool> isLoading = RxNotifier<bool>(false);
  bool get getIsLoading => isLoading.value;

  UserModel getUserModel() {
    return UserModel.fromJson(
      {
        "email": emailEditingController.text,
        "name": nameEditingController.text,
        "password": passwordEditingController.text,
        "permission": getPermission
      },
    );
  }
}
