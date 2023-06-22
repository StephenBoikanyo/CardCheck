import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:card_check/presentation/widgets/rounded_primary_button.dart';

void main() {
  testWidgets('renders rounded primary button', (WidgetTester tester) async {
    final label = 'Submit';
    bool pressed = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: RoundedPrimaryButton(
            label: label,
            onPressed: () {
              pressed = true;
            },
          ),
        ),
      ),
    );

    // Verify the presence of the elevated button
    expect(find.byType(ElevatedButton), findsOneWidget);

    // Verify the button label text
    expect(find.text(label), findsOneWidget);

    // Verify the button color
    final elevatedButton = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
    expect(elevatedButton.style!.backgroundColor, equals(Colors.black));

    // Tap the button
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    // Verify that onPressed callback is triggered
    expect(pressed, isTrue);
  });
}
