import 'package:flutter/material.dart';

import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import '../../../data/sampledata.dart';
import '../home.dart';
import '../../login/login.dart';

class HomeForm extends StatefulWidget {
  @override
  _HomeFormState createState() => _HomeFormState();
}

class _HomeFormState extends State<HomeForm> {
  final _markers = <Marker>[];
  @override
  void initState() {
    super.initState();
    stations.forEach((station) {
      Map<String, dynamic> location = station['location'];
      _markers.add(Marker(
          point: LatLng(location['coordinates'][0], location['coordinates'][1]),
          builder: (ctx) =>
              Icon(Icons.location_on, color: Theme.of(context).primaryColor)));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildMap(),
        SafeArea(
          minimum: EdgeInsets.only(left: 20, top: 20),
          child: CustomButton(
            icon: Icons.account_circle_outlined,
            onTap: () => Navigator.pushNamed(context, LoginPage.routeName),
          ),
        ),
      ],
    );
  }

  Widget _buildMap() {
    return FlutterMap(
      options: MapOptions(
        center: LatLng(59.960938, 30.351599),
        zoom: 8.0,
      ),
      layers: [
        TileLayerOptions(
          urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
          subdomains: ['a', 'b', 'c'],
        ),
        MarkerLayerOptions(
          markers: _markers,
        ),
      ],
    );
  }
}
