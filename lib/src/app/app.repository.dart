import 'package:dio/dio.dart';

class AppRepository {
  static final String path = 'https://app-proex.herokuapp.com';
  static final String queryLogin = '/login';
  static final String queryUser = '/users';
  static final String queryMap = '/map';
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

  Future<String> post({required dynamic model, required String query}) async {
    final String erroMessage = "Erro na consulta";
    try {
      return await dio
          .post(
        AppRepository.path + AppRepository.queryLogin,
        data: model.toJson(),
      )
          .then(
        (res) {
          return res.data;
        },
      );
    } catch (e) {
      return erroMessage;
    }
  }
}
