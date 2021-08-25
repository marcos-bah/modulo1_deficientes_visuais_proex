import 'package:dio/dio.dart';
import 'package:modulo1_deficientes_visuais_proex/src/app/app.repository.dart';
import 'package:modulo1_deficientes_visuais_proex/src/features/maps/map.model.dart';

class MapRepository extends AppRepository {
  Dio dio = new Dio();

  Future<String> createMap(MapModel mapModel) async {
    try {
      return await dio
          .post(
        AppRepository.path + AppRepository.queryMap,
        data: mapModel.toJson(),
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
