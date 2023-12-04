import 'package:flutter/material.dart';

final MaterialColor customTeal = MaterialColor(
  0xFF00796B,
  <int, Color>{
    50: Colors.teal[50]!,
    100: Colors.teal[100]!,
    200: Colors.teal[200]!,
    300: Colors.teal[300]!,
    400: Colors.teal[400]!,
    500: Colors.teal[500]!,
    600: Colors.teal[600]!,
    700: Colors.teal[700]!,
    800: Colors.teal[800]!,
    900: Colors.teal[900]!,
  },
);
bool isMobile(BuildContext context) => MediaQuery.of(context).size.width < 600;
