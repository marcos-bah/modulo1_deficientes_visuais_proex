import 'package:flutter/cupertino.dart';
import 'package:rx_notifier/rx_notifier.dart';

class MapController {
  TextEditingController mapEditingController = TextEditingController();
  TextEditingController geoEditingController = TextEditingController();
  TextEditingController descriptionEditingController = TextEditingController();

  RxNotifier<bool> isVisible = RxNotifier<bool>(false);
  bool get getIsVisible => isVisible.value;

  RxNotifier<bool> isLoading = RxNotifier<bool>(false);
  bool get getIsLoading => isLoading.value;


}
