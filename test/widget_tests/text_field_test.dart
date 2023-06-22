import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:card_check/presentation/widgets/custom_textfield.dart';

void main() {
  testWidgets('renders custom text field', (WidgetTester tester) async {
    final fieldLabel = 'Enter text';
    final fieldController = TextEditingController();

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomTextField(
            fieldLabel: fieldLabel,
            fieldController: fieldController,
          ),
        ),
      ),
    );

    // Verify the presence of the text field
    expect(find.byType(TextField), findsOneWidget);

    // Verify the label text
    expect(find.text(fieldLabel), findsOneWidget);
  });

  testWidgets('enters text in custom text field', (WidgetTester tester) async {
    final fieldLabel = 'Enter text';
    final fieldController = TextEditingController();

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomTextField(
            fieldLabel: fieldLabel,
            fieldController: fieldController,
          ),
        ),
      ),
    );

    final textField = find.byType(TextField);

    // Enter text into the text field
    await tester.enterText(textField, 'Hello');
    await tester.pump();

    // Verify that the text is entered correctly
    expect(fieldController.text, 'Hello');
  });
}
