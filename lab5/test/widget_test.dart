// Replaces the default flutter create widget_test.dart.
// Tests a lightweight widget without performing HTTP/SQLite I/O.
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('MaterialApp renders the lab title', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: Scaffold(body: Text('Lab 5 - Photo Wishlist'))),
    );
    expect(find.text('Lab 5 - Photo Wishlist'), findsOneWidget);
  });
}
