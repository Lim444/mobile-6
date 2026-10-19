import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kalkulator_bmi/main.dart';

void main() {
  testWidgets('calculates BMI and updates category when gender changes',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Kalkulator BMI'), findsOneWidget);
    expect(find.text('Masukkan Data Anda!!!'), findsOneWidget);

    await tester.enterText(find.byType(TextField).at(0), '70');
    await tester.enterText(find.byType(TextField).at(1), '175');
    await tester.tap(find.text('Hitung BMI'));
    await tester.pump();

    expect(find.text('22.9'), findsOneWidget);
    expect(find.text('Laki-laki: Mantap Euy Ideal'), findsOneWidget);

    await tester.tap(find.text('Perempuan'));
    await tester.pump();

    expect(find.text('Perempuan: Mantap Euy Ideal'), findsOneWidget);
  });

  testWidgets('shows an error for invalid input and reset clears the form',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.enterText(find.byType(TextField).at(0), '0');
    await tester.enterText(find.byType(TextField).at(1), '175');
    await tester.tap(find.text('Hitung BMI'));
    await tester.pump();

    expect(find.text('Data Tidak Valid!!!'), findsOneWidget);

    await tester.tap(find.text('Reset'));
    await tester.pump();

    expect(find.text('Masukkan Data Anda!!!'), findsOneWidget);
    expect(find.text('Nilai Kosong'), findsOneWidget);
    expect(find.text('Laki-laki'), findsOneWidget);
  });
}
