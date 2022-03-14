import 'package:appmotors/app/presentation/pages/app.dart';
import 'package:appmotors/bootstrap.dart';
import 'package:flutter/material.dart';
import 'injection.dart' as di;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  di.setup();
  bootstrap(() => const App());
}
