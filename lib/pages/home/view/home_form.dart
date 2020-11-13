import 'package:flutter/material.dart';

import 'package:latlong/latlong.dart';
import 'package:flutter_map/flutter_map.dart';

class HomeForm extends StatefulWidget {
  @override
  _HomeFormState createState() => _HomeFormState();
}

class _HomeFormState extends State<HomeForm> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildMap(),
        _customButton(),
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
      ],
    );
  }

  Widget _customButton() {
    return SafeArea(
      minimum: EdgeInsets.only(bottom: 20, left: 20),
      child: GestureDetector(
        onTap: _showDrawer,
        child: Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: Offset(0, 2),
                )
              ]),
          child: Icon(
            Icons.menu,
            size: 30,
            color: Colors.blueAccent,
          ),
        ),
      ),
    );
  }

  _showDrawer() {
    if (Scaffold.of(context).isDrawerOpen)
      Scaffold.of(context).openEndDrawer();
    else
      Scaffold.of(context).openDrawer();
  }
}
