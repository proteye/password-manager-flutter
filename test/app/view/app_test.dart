import 'package:flutter_test/flutter_test.dart';
import 'package:password_manager/app/app.dart';
import 'package:password_manager/counter/counter.dart';

void main() {
  group('App', () {
    testWidgets('renders CounterPage', (tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(CounterPage), findsOneWidget);
    });
  });
}
