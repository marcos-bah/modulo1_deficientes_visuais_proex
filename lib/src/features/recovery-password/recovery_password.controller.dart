import 'package:flutter/material.dart';
import 'package:rx_notifier/rx_notifier.dart';

class RecoveryPasswordController {
  TextEditingController emailEditingController = TextEditingController();

  RxNotifier<bool> isLoading = RxNotifier<bool>(false);
  bool get getIsLoading => isLoading.value;
}
