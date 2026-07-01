import 'package:flutter_test/flutter_test.dart';
import 'package:smart_state_app/main.dart';
import 'package:smart_state_app/features/splash/splash_screen.dart';

void main() {
  testWidgets('Splash Screen displays branding and security info', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const SmartState());

    // Verify that the splash screen shows key text elements.
    expect(find.text('Smart State'), findsOneWidget);
    expect(find.text('INTELLIGENT GOVERNANCE'), findsOneWidget);
    expect(find.text('System initializing...'), findsOneWidget);
    expect(find.text('SECURE CONNECTION ESTABLISHED'), findsOneWidget);
    expect(find.text('Encrypted End-to-End'), findsOneWidget);

    // Verify that the custom background/branding layout is present
    expect(find.byType(SplashScreen), findsOneWidget);
  });
}
