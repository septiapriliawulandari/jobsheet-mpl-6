import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jobsheet_6_mpl/main.dart'; // Sesuaikan dengan nama proyek yang benar

void main() {
  testWidgets('Student names slider test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify the first student name and 'Apa kabar?' are displayed.
    expect(find.text('Apa kabar'), findsOneWidget);
    expect(find.text('Septi'), findsOneWidget);
    expect(find.text('Fatin'), findsNothing);
    expect(find.text('Immaculata'), findsNothing);
    expect(find.text('Margereta'), findsNothing);
    expect(find.text('Salsabila'), findsNothing);

    // Swipe to the second page.
    await tester.drag(find.byType(PageView), Offset(-400, 0));
    await tester.pumpAndSettle();

    // Verify the second student name and 'Apa kabar?' are displayed.
    expect(find.text('Apa kabar'), findsOneWidget);
    expect(find.text('Fatin'), findsOneWidget);
    expect(find.text('Septi'), findsNothing);
    expect(find.text('Immaculata'), findsNothing);
    expect(find.text('Margereta'), findsNothing);
    expect(find.text('Salsabila'), findsNothing);

    // Swipe to the third page.
    await tester.drag(find.byType(PageView), Offset(-400, 0));
    await tester.pumpAndSettle();

    // Verify the third student name and 'Apa kabar?' are displayed.
    expect(find.text('Apa kabar'), findsOneWidget);
    expect(find.text('Immaculata'), findsOneWidget);
    expect(find.text('Septi'), findsNothing);
    expect(find.text('Fatin'), findsNothing);
    expect(find.text('Margereta'), findsNothing);
    expect(find.text('Salsabila'), findsNothing);

    // Swipe to the fourth page.
    await tester.drag(find.byType(PageView), Offset(-400, 0));
    await tester.pumpAndSettle();

    // Verify the fourth student name and 'Apa kabar?' are displayed.
    expect(find.text('Apa kabar'), findsOneWidget);
    expect(find.text('Margereta'), findsOneWidget);
    expect(find.text('Septi'), findsNothing);
    expect(find.text('Fatin'), findsNothing);
    expect(find.text('Immaculata'), findsNothing);
    expect(find.text('Salsabila'), findsNothing);

    // Swipe to the fifth page.
    await tester.drag(find.byType(PageView), Offset(-400, 0));
    await tester.pumpAndSettle();

    // Verify the fifth student name and 'Apa kabar?' are displayed.
    expect(find.text('Apa kabar'), findsOneWidget);
    expect(find.text('Salsabila'), findsOneWidget);
    expect(find.text('Septi'), findsNothing);
    expect(find.text('Fatin'), findsNothing);
    expect(find.text('Immaculata'), findsNothing);
    expect(find.text('Margereta'), findsNothing);

    // Swipe to the sixth page (Andi's page).
    await tester.drag(find.byType(PageView), Offset(-400, 0));
    await tester.pumpAndSettle();

    // Verify the text 'Apa kabar' and 'Andi' are displayed.
    expect(find.text('Apa kabar'), findsOneWidget);
    expect(find.text('Andi'), findsOneWidget);

    // Record the color of 'Andi' text.
    Text andiTextWidget = tester.widget(find.text('Andi'));
    Color initialColor = andiTextWidget.style?.color ?? Colors.black;

    // Tap the refresh button and trigger a frame.
    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();

    // Verify the color of 'Andi' text has changed.
    andiTextWidget = tester.widget(find.text('Andi'));
    Color newColor = andiTextWidget.style?.color ?? Colors.black;
    expect(newColor != initialColor, true);
  });
}
