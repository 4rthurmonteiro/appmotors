import 'package:appmotors/app/app.dart';
import 'package:appmotors/features/vehicle/presentation/pages/vehicle_detail_page.dart';
import 'package:appmotors/features/vehicle/presentation/pages/vehicles_page.dart';
import 'package:appmotors/features/vehicle/presentation/widgets/vehicle_item.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:appmotors/injection.dart' as di;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    di.setup(useFakeDataSource: true);
  });
  testWidgets("Test App", (WidgetTester tester) async {
    await tester.pumpWidget(const App());
    await tester.pumpAndSettle();

    await tester.tap(find.byType(VehicleItem).first);
    await tester.pumpAndSettle();

    expect(find.byType(VehicleDetailPage), findsOneWidget);
    expect(find.byType(VehiclesPage), findsNothing);
  });
}
