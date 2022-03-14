import 'package:appmotors/app/presentation/pages/app.dart';
import 'package:appmotors/features/vehicle/presentation/pages/vehicles_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:appmotors/injection.dart' as di;

void main() {
  group('App', () {
    setUp(() {
      di.setup(useFakeDataSource: true);
    });
    testWidgets('renders VehiclesPage', (tester) async {
      await tester.pumpWidget(const App());
      await tester.pumpAndSettle();
      expect(find.byType(VehiclesPage), findsOneWidget);
    });
  });
}
