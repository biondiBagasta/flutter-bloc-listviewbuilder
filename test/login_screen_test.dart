import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:project_kop_sq_mobile/cubit/login_screen_cubit.dart';
import 'package:project_kop_sq_mobile/cubit/show_hide_password_cubit.dart';
import 'package:project_kop_sq_mobile/screens/login_screen.dart';

void main() {

  late LoginScreenCubit loginScreenCubit;
  late ShowHidePasswordCubit showHidePasswordCubit;

  setUp(() {
    loginScreenCubit = LoginScreenCubit();
    showHidePasswordCubit = ShowHidePasswordCubit();
  });

  Widget loginScreen() {
    return MaterialApp(
      home: Scaffold(
        body: MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => LoginScreenCubit()),
            BlocProvider(create: (_) => ShowHidePasswordCubit())
          ],
          child: const LoginScreen(),
        )
      ),
    );
  }
  group('Find Widget Key in Login Screen', () { 
    testWidgets("Find Email Field Key", (widgetTester) async {
      await widgetTester.pumpWidget(loginScreen());
      expect(find.byKey(const Key('email_field')), findsWidgets);
    });
    testWidgets("Find Password Field Key", (widgetTester) async {
      await widgetTester.pumpWidget(loginScreen());
      expect(find.byKey(const Key('password_field')), findsWidgets);
    });

    testWidgets("Find Submit Login Button Key", (widgetTester) async {
      await widgetTester.pumpWidget(loginScreen());
      expect(find.byKey(const Key('submit_login_button')), findsWidgets);
    });
  });

  group('Finds by Text', () {
    testWidgets('Find Lupa Password Text', (widgetTester) async {
      await widgetTester.pumpWidget(loginScreen());

      await widgetTester.pump();

      expect(find.text('Lupa Password'), findsWidgets);
    });
  });

  testWidgets('Ensure Submit Button was working', 
  (widgetTester) async {
    await widgetTester.pumpWidget(loginScreen());

    await widgetTester.enterText(find.byKey(const Key('email_field')), 'biondibagastawp@gmail.com').then((_) {
      loginScreenCubit.emailController.text = 'biondibagastawp@gmail.com';
    });
    await widgetTester.enterText(find.byKey(const Key('password_field')), 'password').then((_) {
      loginScreenCubit.passwordController.text = 'password';
    });
    expect(find.text('biondibagastawp@gmail.com'), findsOneWidget);
    expect(find.text('password'), findsOneWidget);

    await widgetTester.tap(find.byKey(const Key('submit_login_button'))).then((_) {
      loginScreenCubit.login();
    });

    expect(loginScreenCubit.emailController.text, 'biondibagastawp@gmail.com');
  });


  testWidgets('Show Hide Button', 
    (widgetTester) async {
      var currentIsShowPasswordState = showHidePasswordCubit.state.isShowedPassword;
      await widgetTester.pumpWidget(loginScreen());

      final gestureDetectorChangeIcon = find.descendant(of: find.byKey(const Key('password_field')), 
      matching: find.byType(GestureDetector));

      expect(gestureDetectorChangeIcon, findsOneWidget);

      await widgetTester.tap(gestureDetectorChangeIcon).then((_) {
        showHidePasswordCubit.showHidePassword();
      });
      
      expect(showHidePasswordCubit.state.isShowedPassword, !currentIsShowPasswordState);
    }
  );
}