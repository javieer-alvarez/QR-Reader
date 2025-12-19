import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../models/models.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  MapType mapType = MapType.normal;

  @override
  Widget build(BuildContext context) {
    final ScanModel scan =
        ModalRoute.of(context)!.settings.arguments as ScanModel;

    CameraPosition puntoInicial =
        CameraPosition(target: scan.getLatLng(), zoom: 17.5, tilt: 50);

    Set<Marker> markers = <Marker>{};
    markers.add(Marker(
      markerId: const MarkerId('Geo-Uniq'),
      position: scan.getLatLng(),
    ));

    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () async {
                  final GoogleMapController controller =
                      await _controller.future;
                  await controller.animateCamera(CameraUpdate.newCameraPosition(
                      puntoInicial
                      /*también se podría poner el código que usa fernando en la clase 188
                    que es literalmente escrinir lo que está al lado derecho del "0"
                    */
                      ));
                },
                icon: const Icon(Icons.location_searching_outlined))
          ],
          title: const Text('Map'),
        ),
        body: GoogleMap(
          mapToolbarEnabled: true,
          compassEnabled: true,
          myLocationButtonEnabled: false,
          markers: markers,
          mapType: mapType,
          initialCameraPosition: puntoInicial,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (mapType == MapType.normal) {
              mapType = MapType.satellite;
            } else if (mapType == MapType.satellite) {
              mapType = MapType.hybrid;
            } else if (mapType == MapType.hybrid) {
              mapType = MapType.normal;
            }

            setState(() {});
          },
          child: const Icon(Icons.layers),
        ));
  }
}
