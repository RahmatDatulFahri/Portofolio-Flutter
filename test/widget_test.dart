import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio_flutter/main.dart';
import 'package:portfolio_flutter/widgets/navbar.dart';
import 'package:portfolio_flutter/widgets/hero_section.dart';
import 'package:portfolio_flutter/widgets/about_section.dart';
import 'package:portfolio_flutter/widgets/experience_section.dart';

void main() {
  testWidgets('Renders properly on Mobile screen (360x780) without layout errors',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(360, 780);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);

    await tester.pumpWidget(const PortfolioApp());
    await tester.pumpAndSettle();

    expect(find.byType(Navbar), findsOneWidget);
    expect(find.byType(HeroSection), findsOneWidget);
    expect(find.byType(AboutSection), findsOneWidget);
    expect(find.byType(ExperienceSection), findsOneWidget);

    // On mobile, the hamburger menu icon button should exist
    expect(find.byIcon(Icons.menu), findsOneWidget);
  });

  testWidgets('Renders properly on Tablet screen (768x1024) without layout errors',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(768, 1024);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);

    await tester.pumpWidget(const PortfolioApp());
    await tester.pumpAndSettle();

    expect(find.byType(Navbar), findsOneWidget);
    expect(find.byType(HeroSection), findsOneWidget);
    expect(find.byType(ExperienceSection), findsOneWidget);
  });

  testWidgets('Renders properly on Desktop screen (1440x900) without layout errors',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1440, 900);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);

    await tester.pumpWidget(const PortfolioApp());
    await tester.pumpAndSettle();

    expect(find.byType(Navbar), findsOneWidget);
    // On desktop, full nav links are visible
    expect(find.text('PROJECTS'), findsWidgets);
    expect(find.byType(HeroSection), findsOneWidget);
  });
}
