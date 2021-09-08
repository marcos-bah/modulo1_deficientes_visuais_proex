import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:modulo1_deficientes_visuais_proex/src/app/app.repository.dart';
import 'package:modulo1_deficientes_visuais_proex/src/features/shared/user.model.dart';

class CreateAccountRepository extends AppRepository {
  Dio dio = new Dio();

  Future<String> createAccount(UserModel userModel) async {
    try {
      return await dio
          .post(
        AppRepository.path + AppRepository.queryUser,
        data: userModel.toJson(),
      )
          .then(
        (value) {
          return value.toString();
        },
      );
    } on DioError catch (e) {
      print(e);
      if (e.response != null) {
        if (e.response!.statusCode == 404) {
          return jsonEncode({"code": 404, "message": "API Offline"});
        }
        return jsonEncode({'erro': e.response.toString()});
      }
      return jsonEncode({'erro': e.response.toString()});
    } catch (e) {
      print(e);
      return jsonEncode({"code": 5000, "message": "Error Interno"});
    }
  }
}
