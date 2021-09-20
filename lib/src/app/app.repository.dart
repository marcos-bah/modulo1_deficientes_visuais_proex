import 'dart:convert';

import 'package:dio/dio.dart';

class AppRepository {
  static final String path = 'https://app-proex.herokuapp.com';
  static final String queryLogin = '/login';
  static final String queryUser = '/users';
  static final String queryMap = '/maps';
  static final String queryBuilder = '/api/accounts';
  static final String queryOrganization = '/api/accounts';

  Dio dio = new Dio();

  Future<String> postToken(
      {required dynamic model, required String query}) async {
    final String erroMessage = "Erro na consulta";
    try {
      return await dio
          .post(
        AppRepository.path + AppRepository.queryLogin,
        data: model.toJson(),
      )
          .then(
        (res) {
          return res.data['token'] ?? erroMessage;
        },
      );
    } catch (e) {
      return erroMessage;
    }
  }

  Future<String> post(
      {required dynamic model, required String query, Options? options}) async {
    final String erroMessage = "Erro na consulta";
    print(model.toJson());
    try {
      return await dio
          .post(
        AppRepository.path + query,
        data: model.toJson(),
        options: options,
      )
          .then(
        (res) {
          return res.data.toString();
        },
      );
    } catch (e) {
      print(e);
      return erroMessage;
    }
  }

  Future<String> get(
      {required String id, required String query, Options? options}) async {
    final String erroMessage = "Erro na consulta";
    print(AppRepository.path + query + '/' + id);
    try {
      return await dio
          .get(
        AppRepository.path + query + '/' + id,
        options: options,
      )
          .then(
        (res) {
          return res.data["id"] == null
              ? res.data.toString()
              : jsonEncode(res.data);
        },
      );
    } catch (e) {
      print(e);
      return erroMessage;
    }
  }
}
