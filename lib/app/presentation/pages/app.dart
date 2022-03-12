import 'package:appmotors/features/vehicle/presentation/pages/vehicles_page.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: Colors.red,
        ),
        colorScheme: ColorScheme.fromSwatch(
          accentColor: Colors.redAccent,
        ),
      ),
      home: const VehiclesPage(),
    );
  }
}
