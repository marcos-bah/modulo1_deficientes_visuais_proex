import 'package:dio/dio.dart';
import 'package:modulo1_deficientes_visuais_proex/src/features/shared/user.model.dart';

class CreateAccountRepository {
  Dio dio = new Dio();

  static final String path = 'localhost';
  static final String query = '/api/accounts';

  Future<String> createAccount(UserModel userModel) async {
    try {
      return await dio
          .post(
        path + query,
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
}
