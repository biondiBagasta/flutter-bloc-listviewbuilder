import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'login_screen_state.dart';

class LoginScreenCubit extends Cubit<LoginScreenState> {
  LoginScreenCubit() : super(LoginScreenInitial());

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void login() {
  }

  @override
  Future<void> close() async {
    super.close();
    emailController.dispose();
    passwordController.dispose();
  }
}
