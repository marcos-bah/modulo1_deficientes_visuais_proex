import 'package:flutter/material.dart';
import 'package:modulo1_deficientes_visuais_proex/src/app/app.color.dart';
import 'package:modulo1_deficientes_visuais_proex/src/features/maps/map.controller.dart';
import 'package:flutter_svg/flutter_svg.dart';


class ViewMapView extends StatefulWidget {
  const ViewMapView({Key? key}) : super(key: key);

  @override
  _ViewMapViewState createState() => _ViewMapViewState();
}

class _ViewMapViewState extends State<ViewMapView> {
  MapController controller = MapController();
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
                      Text(
                        controller.getName.isNotEmpty
                            ? controller.getName
                            : "----",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
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
                      Text(
                        controller.getDescription.isNotEmpty
                            ? controller.getDescription
                            : "----",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
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
              Expanded(
          child: svg
        ),
            ],
          ),
        ),
      ),
    );
  }
}
