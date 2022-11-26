import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SimpleMapScreen extends StatefulWidget {
  const SimpleMapScreen({Key? key}) : super(key: key);

  @override
  State<SimpleMapScreen> createState() => _SimpleMapScreenState();
}

class _SimpleMapScreenState extends State<SimpleMapScreen> {
  //we will pas this controller to google map, we can control the google map
  //from anywhere, we don't need to pass it anywhere to access google map
  //by using this controller, we can move the camera position to any point.
  final Completer<GoogleMapController> _controller = Completer();

//after that we need to create a initial position static

  static const CameraPosition initialPosition =
  CameraPosition(target: LatLng(37.42796133580664, -122.085749655962), zoom: 14.0);

//We need to create the target position after we click the floating action button
  static const CameraPosition targetPosition = CameraPosition(
      target: LatLng(37.42796133583084, -122.085749655489043),
      zoom: 14.0,
      bearing: 192.0,
      tilt: 60);

  @override
  Widget build(BuildContext context) {
    //this is a build function
    return Scaffold(
      appBar: AppBar(
        title: const Text("Simple Google Map"),
        centerTitle: true,
      ),
      body: GoogleMap(
        initialCameraPosition: initialPosition,
        mapType: MapType.normal,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          goToLake();
        },
        label: const Text("To the lake!"),
        icon: const Icon(Icons.directions_boat),
      ),
    );
  }
  //function

    Future<void> goToLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(targetPosition));
  }
}
