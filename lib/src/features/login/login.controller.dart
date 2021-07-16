import 'package:flutter/cupertino.dart';
import 'package:rx_notifier/rx_notifier.dart';

class LoginController {
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();

  RxNotifier<bool> isVisible = RxNotifier<bool>(false);
  bool get getIsVisible => isVisible.value;

  RxNotifier<bool> isLoading = RxNotifier<bool>(false);
  bool get getIsLoading => isLoading.value;
}
