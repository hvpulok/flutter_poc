import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  final String title = 'Google Map';

  // MapsDemo(this.title);

  @override
  State createState() => GoogleMapsExampleState();
}

class GoogleMapsExampleState extends State<MapPage> {
  GoogleMapController mapController;
  MapType _mapType = MapType.normal;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            child: GoogleMap(
              mapType: _mapType,
              initialCameraPosition: const CameraPosition(
                bearing: 270.0,
                target: LatLng(35.227085, -80.843124),
                tilt: 30.0,
                zoom: 10.0,
              ),
              onMapCreated: _onMapCreated,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                onPressed: mapController == null
                    ? null
                    : () {
                        mapController
                          ..animateCamera(CameraUpdate.newCameraPosition(
                            const CameraPosition(
                              bearing: 270.0,
                              target: LatLng(47.751076, -120.740135),
                              tilt: 30.0,
                              zoom: 10.0,
                            ),
                          ))
                          ..addMarker(MarkerOptions(
                            position: LatLng(47.751076, -120.740135),
                            infoWindowText:
                                InfoWindowText("Capital", "Washington"),
                          ));
                      },
                mini: true,
                child: Icon(Icons.my_location),
              ),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Align(
          //     alignment: Alignment.topCenter,
          //     child: _mapTypeCycler(),
          //   ),
          // )
        ],
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
    });
  }

  Widget _mapTypeCycler() {
    final MapType nextType =
        MapType.values[(_mapType.index + 1) % MapType.values.length];
    return FloatingActionButton(
      onPressed: () => setState(() {
            _mapType = nextType;
          }),
      mini: false,
      child: Icon(Icons.terrain),
    );
  }
}
