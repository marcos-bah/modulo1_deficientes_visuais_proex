import 'package:flutter/material.dart';
import 'package:rx_notifier/rx_notifier.dart';

class CreateAccountController {
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController nameEditingController = TextEditingController();

  RxNotifier<bool> isLoading = RxNotifier<bool>(false);
  bool get getIsLoading => isLoading.value;
}
