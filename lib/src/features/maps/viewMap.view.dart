import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:modulo1_deficientes_visuais_proex/src/app/app.color.dart';
import 'package:modulo1_deficientes_visuais_proex/src/app/app.repository.dart';
import 'package:modulo1_deficientes_visuais_proex/src/features/maps/map.controller.dart';
import 'package:modulo1_deficientes_visuais_proex/src/features/shared/user.model.dart';
import 'package:provider/provider.dart';
import 'package:rx_notifier/rx_notifier.dart';

class ViewMapView extends StatefulWidget {
  final String id;
  const ViewMapView({Key? key, required this.id}) : super(key: key);

  @override
  _ViewMapViewState createState() => _ViewMapViewState();
}

class _ViewMapViewState extends State<ViewMapView> {
  MapController controller = MapController();
  AppRepository appRepository = AppRepository();
  late UserModel rootModel;

  @override
  void initState() {
    rootModel = Provider.of<UserModel>(context, listen: false);
    appRepository
        .get(
      id: widget.id,
      query: AppRepository.queryMap,
      options: Options(
        headers: {
          'Authorization': 'Bearer ' +
              (rootModel.token.isNotEmpty
                  ? rootModel.token
                  : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Imx1Y2FzQHVuaWZlaS5iciIsImlhdCI6MTYzMjE0MDYyMCwiZXhwIjoxNjMyMjI3MDIwLCJzdWIiOiIwZjQwYjJlMS01N2YwLTRlMTMtOTQ5ZS1mYWVkOWE1OGMxYWUifQ.vhNVgN_ByLE9RranMtSokYVy01zCTlqYzqUA23vF6j8"),
        },
      ),
    )
        .then((res) {
      var json = jsonDecode(res);
      if (json['id'] != null) {
        controller.description.value = json['description'];
        controller.descriptionEditingController.text = json['description'];
        controller.name.value = json['name'];
        controller.nameEditingController.text = json['name'];
        controller.source.value = json['source'];
        controller.sourceEditingController.text = json['source'];
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final String assetName = 'assets/flutter_logo.svg';
    final Widget svg = SvgPicture.asset(
      assetName,
    );
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Visualizando Mapa"),
        centerTitle: true,
        backgroundColor: AppColors.primary,
      ),
      body: Center(
        child: Container(
          width: size.width < 520 ? size.width * 0.8 : 480,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: size.width < 320 ? size.width * 0.8 : 280,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Visualização\ndo Mapa",
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.w700,
                          color: AppColors.primary,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Título:",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      RxBuilder(
                        builder: (context) => Text(
                          controller.getName,
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Descrição:",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      RxBuilder(
                        builder: (context) => Text(
                          controller.getDescription,
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
              //Mapa aqui
              Expanded(child: svg),
            ],
          ),
        ),
      ),
    );
  }
}
