import 'package:appmotors/app/presentation/pages/app.dart';
import 'package:appmotors/features/vehicle/presentation/pages/vehicles_page.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('App', () {
    testWidgets('renders CounterPage', (tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(VehiclesPage), findsOneWidget);
    });
  });
}
