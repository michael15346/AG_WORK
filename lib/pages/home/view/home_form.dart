import 'package:flutter/material.dart';

import 'package:latlong/latlong.dart';
import 'package:flutter_map/flutter_map.dart';

import '../home.dart';

class HomeForm extends StatefulWidget {
  @override
  _HomeFormState createState() => _HomeFormState();
}

class _HomeFormState extends State<HomeForm> {
  List<Marker> _markers = [];

  @override
  void initState() {
    HomeRepository.sampleData?.asMap()?.forEach((key, data) {
      _markers.add(
        Marker(
          point: LatLng(data['location']['coordinates'][0], data['location']['coordinates'][1]),
          builder: (context) => Container(
            child: Icon(
              Icons.location_on,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildMap(),
        SafeArea(
          minimum: EdgeInsets.only(top: 20, left: 20),
          child: CustomButton(icon: Icons.menu, onTap: _showDrawer),
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

  _showDrawer() => (!Scaffold.of(context).isDrawerOpen) ? Scaffold.of(context).openDrawer() : null;
}
