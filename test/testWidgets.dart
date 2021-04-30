import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobilapp/home.dart';

import 'package:mobilapp/login.dart';

//void login() => run(_testLogin);

void main() {
  testWidgets('Test login widgets', (WidgetTester tester) async{
    // Widgets needed
    var emailField = find.byKey(ValueKey("emailField"));
    var passField = find.byKey(ValueKey("passwordField"));
    var loginBtn = find.byKey(ValueKey("emailField"));

    // Execute the test
    await tester.pumpWidget(MaterialApp(home: Login()));
    await tester.enterText(emailField, "someemail@email.no");
    await tester.enterText(passField, "somePassword");
    await tester.tap(loginBtn);
    // rebuilds widget
    await tester.pump();

    // Check output
    expect(find.text("someemail@email.no"), findsOneWidget);
    expect(find.text("somePassword"), findsOneWidget);

  });
}
