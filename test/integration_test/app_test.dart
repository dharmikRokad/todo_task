import 'package:flutter/material.dart'
    show Icons, Checkbox, FloatingActionButton;
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:myapp/main.dart' as app;
import 'package:sqflite_common_ffi/sqflite_ffi.dart'
    show sqfliteFfiInit, databaseFactory, databaseFactoryFfi;

void main() {
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;

  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('ToDo App Integration Tests', () {
    testWidgets('add new todo and verify', (tester) async {
      app.main();
      await tester.pumpAndSettle();

      expect(find.text('welcome back'), findsOneWidget);

      final fabFinder = find.byType(FloatingActionButton);
      expect(fabFinder, findsOneWidget);
      await tester.tap(fabFinder);
      await tester.pumpAndSettle();

      await tester.enterText(find.bySemanticsLabel('Title'), 'Test Task');
      await tester.enterText(
          find.bySemanticsLabel('Description'), 'This is a test');
      await tester.tap(find.text('Save'));
      await tester.pumpAndSettle();

      expect(find.text('Test Task'), findsOneWidget);
      expect(find.text('This is a test'), findsOneWidget);
    });

    testWidgets('mark todo as done', (tester) async {
      app.main();
      await tester.pumpAndSettle();

      final checkboxFinder = find.byType(Checkbox).first;
      await tester.tap(checkboxFinder);
      await tester.pumpAndSettle();

      final checkbox = tester.widget<Checkbox>(checkboxFinder);
      expect(checkbox.value, true);
    });

    testWidgets('delete a todo', (tester) async {
      app.main();
      await tester.pumpAndSettle();

      final todoTileFinder = find.text('Test Task');
      expect(todoTileFinder, findsOneWidget);

      await tester.drag(todoTileFinder, const Offset(-500, 0));
      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.delete));
      await tester.pumpAndSettle();

      await tester.tap(find.text('Yes'));
      await tester.pumpAndSettle();

      expect(find.text('Test Task'), findsNothing);
    });
  });
}
