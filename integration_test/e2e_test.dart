import 'package:appmotors/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:appmotors/injection.dart' as di;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    di.setup(useFakeDataSource: false);
  });
  testWidgets("End to End Test App", (WidgetTester tester) async {
    await tester.pumpWidget(const App());
    await tester.pumpAndSettle();

    final listFinder = find.byType(Scrollable);
    final itemFinder = find.byKey(const ValueKey('item_9_car'));

    await tester.scrollUntilVisible(
      itemFinder,
      500.0,
      scrollable: listFinder,
    );

    expect(itemFinder, findsOneWidget);

    final newLoadedItemFinder = find.byKey(const ValueKey('item_12_car'));

    await tester.scrollUntilVisible(
      newLoadedItemFinder,
      500.0,
      scrollable: listFinder,
    );

    expect(newLoadedItemFinder, findsOneWidget);
  });
}
