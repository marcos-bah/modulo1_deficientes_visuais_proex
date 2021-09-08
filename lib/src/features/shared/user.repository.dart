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
          return jsonEncode({"code": 404, "message": "API Offline"});
        }
        return jsonEncode({'erro': e.response.toString()});
      }
      return jsonEncode({'erro': e.response.toString()});
    } catch (e) {
      return jsonEncode({"code": 5000, "message": "Error Interno"});
    }
  }

  Future<String> getUser({required String uid}) async {
    try {
      return await dio
          .post(
        AppRepository.path + AppRepository.queryUser + "/" + uid,
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
          return jsonEncode({"code": 404, "message": "API Offline"});
        }

        return jsonEncode(e.response);
      }
      return jsonEncode(e.response);
    } catch (e) {
      return jsonEncode({"code": 5000, "message": "Error Interno"});
    }
  }

  Future<String> getAllUser() async {
    try {
      return await dio
          .post(
        AppRepository.path + AppRepository.queryUser,
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
          return jsonEncode({"code": 404, "message": "API Offline"});
        }

        return jsonEncode(e.response);
      }
      return jsonEncode(e.response);
    } catch (e) {
      return jsonEncode({"code": 5000, "message": "Error Interno"});
    }
  }

  Future<String> editAccount(UserModel userModel) async {
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
          return jsonEncode({"code": 404, "message": "API Offline"});
        }

        return jsonEncode(e.response);
      }
      return jsonEncode(e.response);
    } catch (e) {
      return jsonEncode({"code": 5000, "message": "Error Interno"});
    }
  }

  Future<String> deleteAccount(String uid) async {
    try {
      return await dio
          .delete(
        AppRepository.path + AppRepository.queryUser + "/" + uid,
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
          return jsonEncode({"code": 404, "message": "API Offline"});
        }

        return jsonEncode(e.response);
      }
      return jsonEncode(e.response);
    } catch (e) {
      return jsonEncode({"code": 5000, "message": "Error Interno"});
    }
  }
}
