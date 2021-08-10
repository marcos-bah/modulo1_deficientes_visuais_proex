import 'package:dio/dio.dart';
import 'package:modulo1_deficientes_visuais_proex/src/features/shared/user_model.dart';

class Repository {
  Dio dio = new Dio();

  static final String pathOrigin = 'localhost';
  static final String queryCreate = '/api/create';
  static final String queryEdit = '/api/edit';
  static final String queryGet = '/api/get';
  static final String queryDelete = '/api/delete';

  Future<String> createAccount(UserModel userModel) async {
    try {
      return await dio
          .post(
        pathOrigin + queryCreate,
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

  Future<String> editAccount(UserModel userModel) async {
    try {
      return await dio
          .post(
        pathOrigin + queryEdit,
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
        pathOrigin + queryDelete + "?id=" + uid,
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
