import 'package:flutter/material.dart';

final ThemeData theme = ThemeData();
final appTheme = ThemeData(
  primarySwatch: Colors.blue,
  colorScheme: theme.colorScheme.copyWith(secondary: Colors.grey[100]),
  shadowColor: Colors.grey.withOpacity(0.5),
  visualDensity: VisualDensity.adaptivePlatformDensity,
);
