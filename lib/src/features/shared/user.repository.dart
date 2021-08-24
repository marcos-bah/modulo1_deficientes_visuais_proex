import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:modulo1_deficientes_visuais_proex/src/app/app.repository.dart';
import 'package:modulo1_deficientes_visuais_proex/src/features/shared/user.model.dart';

class Repository extends AppRepository {
  Dio dio = new Dio();

  Future<String> login({required UserModel userModel}) async {
    try {
      return await dio
          .post(
        AppRepository.path + AppRepository.queryLogin,
        data: userModel.toJson(),
      )
          .then(
        (value) {
          if (value.statusCode == 200) {
            return jsonEncode(value.data);
          }
          return jsonEncode(value.data);
        },
      );
    } on DioError catch (e) {
      if (e.response != null) {
        if (e.response!.statusCode == 404) {
          return "API Offline";
        }

        return e.response!.statusCode.toString();
      }
      return e.toString();
    } catch (e) {
      return e.toString();
    }
  }

  Future<String> editAccount(UserModel userModel) async {
    try {
      return await dio
          .post(
        "",
        data: userModel.toJson(),
      )
          .then(
        (value) {
          return value.toString();
        },
      );
    } on DioError catch (e) {
      if (e.response != null) {
        if (e.response!.statusCode == 404) {
          return "API Offline";
        }
        return e.response!.statusCode.toString();
      }
      return e.toString();
    } catch (e) {
      return e.toString();
    }
  }

  Future<String> deleteAccount(String uid) async {
    try {
      return await dio
          .post(
        "" + "?id=" + uid,
      )
          .then(
        (value) {
          return value.toString();
        },
      );
    } on DioError catch (e) {
      if (e.response != null) {
        if (e.response!.statusCode == 404) {
          return "API Offline";
        }
        return e.response!.statusCode.toString();
      }
      return e.toString();
    } catch (e) {
      return e.toString();
    }
  }
}
