import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:project_kop_sq_mobile/cubit/forgot_password_cubit.dart';
import 'package:project_kop_sq_mobile/cubit/login_screen_cubit.dart';
import 'package:project_kop_sq_mobile/cubit/show_hide_password_cubit.dart';
import 'package:project_kop_sq_mobile/screens/forgot_password_screen.dart';
import 'package:project_kop_sq_mobile/screens/login_screen.dart';
import 'package:project_kop_sq_mobile/screens/notification_screen.dart';

void main() {
  runApp(const MyApp());
}

final GoRouter _router = GoRouter(
  initialLocation: '/notification',
  routes: <RouteBase>[
    GoRoute(
      path: '/login',
      name: '/login',
      builder: (context, state) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => LoginScreenCubit()),
            BlocProvider(create: (_) => ShowHidePasswordCubit())
          ], 
          child: const LoginScreen()
        );
      }
    ),
    GoRoute(
      path: '/forgot-password',
      name: '/forgot-password',
      builder: (context, state) {
        return BlocProvider(
          create: (_) => ForgotPasswordCubit(),
          child: const ForgotPasswordScreen(),
        );
      }
    ),
    GoRoute(
      path: '/notification',
      name: '/notification',
      builder: (context, state) {
        return const NotificationScreen();
      }
    )
  ]
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerConfig: _router,
    );
  }
}
