import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo_frontend/main.dart';

void main() {
  testWidgets('Renders app title and empty state', (WidgetTester tester) async {
    await tester.pumpWidget(const TodoApp());

    expect(find.text('To-Do'), findsOneWidget);
    expect(find.text('No tasks yet. Add your first one above.'), findsOneWidget);
  });

  testWidgets('Can add a task and see it in the list', (WidgetTester tester) async {
    await tester.pumpWidget(const TodoApp());
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextField), 'Buy milk');
    await tester.tap(find.text('Add'));

    // Let ChangeNotifier updates + persistence complete.
    await tester.pumpAndSettle();

    expect(find.text('Buy milk'), findsOneWidget);
  });
}
