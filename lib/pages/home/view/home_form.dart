import 'package:flutter/material.dart';

import 'package:latlong/latlong.dart';
import 'package:flutter_map/flutter_map.dart';

import '../../login/login.dart';

import '../home.dart';

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
        SafeArea(
          minimum: EdgeInsets.only(top: 20, left: 20),
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
      ],
    );
  }
}
