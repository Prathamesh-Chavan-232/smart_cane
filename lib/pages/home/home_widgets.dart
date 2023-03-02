import 'package:flutter/material.dart';
import 'package:smart_cane/globals.dart';
import 'package:syncfusion_flutter_maps/maps.dart';

int battery = 70;
bool wateralert = false;
bool obstaclealert = true;

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late MapZoomPanBehavior _zoomPanBehavior;

  @override
  void initState() {
    _zoomPanBehavior = MapZoomPanBehavior(
      focalLatLng: const MapLatLng(18.5177542, 73.8148826),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        children: [Location(), Map(), Battery(), obstacle(), waterAlert()],
      ),
    );
  }

  Widget Map() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Container(
        height: 300,
        decoration: BoxDecoration(
            color: const Color.fromRGBO(200, 254, 251, 1),
            border: Border.all(color: COLOR_THEME['primary']!, width: 2)),
        child: SfMaps(
          layers: <MapLayer>[
            MapTileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              initialFocalLatLng: const MapLatLng(18.5074213, 73.7871069),
              initialZoomLevel: 10,
              zoomPanBehavior: _zoomPanBehavior,
              initialMarkersCount: 1,
              markerBuilder: (BuildContext context, int index) {
                return const MapMarker(
                  latitude: 18.5177542,
                  longitude: 73.8148826,
                  child: Icon(
                    Icons.location_on,
                    color: Colors.red,
                    size: 20,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

Widget Location() {
  return Padding(
    padding: const EdgeInsets.only(bottom: 20),
    child: Container(
      color: COLOR_THEME['secondary'],
      height: 112,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                    opacity: 0.5,
                    image: AssetImage("assets/bx_rfid.png"),
                  )),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Current Location: 2nd Floor near the lift",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text("RFID Tag No. -12345678",
                        style: TextStyle(fontWeight: FontWeight.bold))
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Row(
              children: [
                SizedBox(
                  height: 31,
                  width: 163,
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                      side: BorderSide(
                                          color: COLOR_THEME['secondary']!)))),
                      child: const Text("View RFID Tags")),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: SizedBox(
                    height: 31,
                    width: 163,
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    side: BorderSide(
                                        color: COLOR_THEME['secondary']!)))),
                        child: const Text("Notify Guardian")),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}

Widget Battery() {
  return Padding(
    padding: const EdgeInsets.only(bottom: 20),
    child: Container(
      color: battery > 20
          ? const Color.fromRGBO(95, 205, 67, 0.2)
          : const Color.fromRGBO(205, 76, 67, 0.35),
      height: 62,
      child: Center(
        child: Text(
          "Device Battery: $battery%",
          style: TextStyle(
              fontSize: 30, color: battery > 20 ? Colors.green : Colors.red),
        ),
      ),
    ),
  );
}

Widget obstacle() {
  return Padding(
    padding: const EdgeInsets.only(bottom: 15),
    child: Container(
      height: 90,
      width: 340,
      decoration: BoxDecoration(
          color: const Color.fromRGBO(255, 244, 187, 1),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: COLOR_THEME['primary']!, width: 2)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "OBSTALE ALERTS",
              style: TextStyle(
                color: COLOR_THEME['primary'],
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          Text(
              obstaclealert
                  ? "Obstacle detected below knee level"
                  : "No obstacle ahead",
              style: const TextStyle(color: Colors.red)),
        ],
      ),
    ),
  );
}

Widget waterAlert() {
  return Padding(
    padding: const EdgeInsets.only(bottom: 30),
    child: Container(
      height: 90,
      width: 340,
      decoration: BoxDecoration(
          color: const Color.fromRGBO(200, 231, 254, 1),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: COLOR_THEME['primary']!, width: 2)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "WATER ALERTS",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: COLOR_THEME['primary']),
            ),
          ),
          Text(wateralert ? "Water/Slippery road ahead" : "Dry Road ahead",
              style: const TextStyle(color: Colors.green)),
        ],
      ),
    ),
  );
}

Widget bottom() {
  return BottomAppBar(
      elevation: 0.2,
      notchMargin: 7,
      clipBehavior: Clip.antiAlias,
      color: COLOR_THEME['primary'],
      child: const SizedBox(
        width: double.infinity,
        height: 60,
      ));
}
