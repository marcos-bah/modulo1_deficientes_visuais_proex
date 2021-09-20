import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:modulo1_deficientes_visuais_proex/src/app/app.repository.dart';
import 'package:modulo1_deficientes_visuais_proex/src/features/maps/map.model.dart';
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

  var isLoadingMap = RxNotifier<bool>(false);
  bool get getIsLoadingMap => isLoadingMap.value;

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

  Future<String> uploadSource({required String token}) async {
    isLoadingMap.value = true;
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles();

      if (result != null) {
        Uint8List fileBytes =
            result.files.first.bytes ?? Uint8List.fromList([]);
        String fileName = result.files.first.name;

        //auth
        await FirebaseAuth.instance.signInAnonymously();

        // Upload file
        return await FirebaseStorage.instance
            .ref('maps/$fileName')
            .putData(fileBytes)
            .then((t) async {
          print(await t.ref.getDownloadURL());
          AppRepository appRepository = AppRepository();
          return await appRepository
              .post(
                model: MapModel(
                  description: getDescription,
                  name: getName,
                  source: (await t.ref.getDownloadURL()).toString(),
                ),
                query: AppRepository.queryMap,
                options: Options(
                  headers: {
                    'Authorization': 'Bearer ' + token,
                  },
                ),
              )
              .then((value) => value.toLowerCase().contains("erro")
                  ? "Erro no upload"
                  : "Sucesso no upload de mapa.");
        }).whenComplete(() => isLoadingMap.value = false);
      } else {
        isLoadingMap.value = false;
        return "Erro no envio do Mapa";
      }
    } catch (e) {
      isLoadingMap.value = false;
      return "Erro no envio do Mapa";
    }
  }
}
