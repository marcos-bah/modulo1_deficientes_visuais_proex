import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/flutter_map.dart';

class ViewMapView extends StatefulWidget {
  const ViewMapView({Key? key}) : super(key: key);

  @override
  _ViewMapViewState createState() => _ViewMapViewState();
}

class _ViewMapViewState extends State<ViewMapView> {
  @override
 Widget build(BuildContext context) {
  return FlutterMap(
    options: MapOptions(
      center: LatLng(-22.41308, -45.45041),
      zoom: 18,
    ),
    layers: [
      TileLayerOptions(
        urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
        subdomains: ['a', 'b', 'c']
      ),
      // MarkerLayerOptions(
      //   markers: [
      //     Marker(
      //       width: 80.0,
      //       height: 80.0,
      //       point: LatLng(51.5, -0.09),
      //       builder: (ctx) =>
      //       Container(
      //         child: FlutterLogo(),
      //       ),
      //     ),
      //   ],
      // ),
    ],
  );
}
}