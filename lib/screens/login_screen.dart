import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_kop_sq_mobile/components/dynamic_size_button.dart';
import 'package:project_kop_sq_mobile/components/dynamic_snackbar.dart';
import 'package:project_kop_sq_mobile/components/password_textfield.dart';
import 'package:project_kop_sq_mobile/components/regular_textfield.dart';
import 'package:project_kop_sq_mobile/components/success_dialog.dart';
import 'package:project_kop_sq_mobile/cubit/login_screen_cubit.dart';
import 'package:project_kop_sq_mobile/cubit/show_hide_password_cubit.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({ Key? key }) : super(key: key);
  
  static final loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final loginScreenCubit = context.read<LoginScreenCubit>();
    final showHidePasswordCubit = context.read<ShowHidePasswordCubit>();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        reverse: false,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: size.width,
              height: size.height * 1.1,
              color: const Color(0xff0D64EF),
            ),
            Center(
              child: SvgPicture.asset(
                'assets/login_pattern.svg',
                semanticsLabel: 'Login Background',
                width: size.width,
                height: size.height,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)
                  ),
                  child: Container(
                    color: Colors.white,
                    height: size.height * 0.35,
                    width: size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset('assets/logo_quantum.svg', width: 135, height: 88,)
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.transparent
                  ),
                  padding: const EdgeInsets.all(20),
                  width: size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Form(
                        key: loginFormKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Text('LOGIN', style: GoogleFonts.poppins(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                letterSpacing: 1.5
                              ),),
                            ),
                            const SizedBox(height: 20,),
                            RegularTextField(
                              widgetKey: const Key('email_field'),
                              label: 'E-Mail', 
                              controller: loginScreenCubit.emailController, 
                              validationMessage: '*Email harus diisi.'
                            ),
                            const SizedBox(height: 20,),
                            BlocBuilder<ShowHidePasswordCubit, ShowHidePasswordState>(
                              builder: (_, state) {
                                return PasswordTextField(
                                  widgetKey: const Key('password_field'),
                                  controller: loginScreenCubit.passwordController, 
                                  validationMessage: '*Password harus diisi.', 
                                  label: 'Password', 
                                  isShowedPassword: state.isShowedPassword, 
                                  showPassword: () {
                                    showHidePasswordCubit.showHidePassword();
                                  }
                                );
                              }
                            ),
                            const SizedBox(height: 8,),
                            GestureDetector(
                              onTap: () {
                                context.goNamed('/forgot-password');
                              },
                              child: Text('Lupa Password', style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Colors.white
                              ),),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 30,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          DynamicSizeButton(
                            widgetKey: const Key('submit_login_button'),
                            label: 'Login', 
                            buttonColor: const Color(0xffFAA626), 
                            onPressed: () {
                              if(loginFormKey.currentState!.validate()) {
                                showDialog(
                                  context: context, 
                                  builder: (context) => 
                                  const SuccessDialog(widgetKey: Key('Login Success Dialog'), 
                                  message: 'Selamat Datang Biondi Bagasta Wiko Putra')
                                );
                              } else {
                                showDynamicSnackBar(
                                  context, 
                                  Icons.error_sharp, 
                                  'ERROR', 
                                  'Email atau Password harus diisi terlebih dahulu.', 
                                  Colors.red
                                );
                              }
                            }, 
                            width: size.width * 0.8,
                            height: 50,
                          ),
                          const SizedBox(height: 25,),
                          SizedBox(
                            width: size.width * 0.8,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: size.width * 0.25,
                                  child: const Divider(
                                    color: Color(0xffE3E9ED),
                                    thickness: 2,
                                  ),
                                ),
                                Text(
                                  'atau login dengan',
                                  style: GoogleFonts.inter(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white
                                  ),
                                ),
                                SizedBox(
                                  width: size.width * 0.25,
                                  child: const Divider(
                                    color: Color(0xffE3E9ED),
                                    thickness: 2,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 25,),
                          SizedBox(
                            width: size.width * 0.6,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
      
                                  },
                                  child: SvgPicture.asset('assets/logo_google.svg', width: 48, height: 48,),
                                ),
                                GestureDetector(
                                  onTap: () {
      
                                  },
                                  child: Image.asset('assets/logo_twitter.png', width: 48, height: 48,),
                                ),
                                GestureDetector(
                                  onTap: () {
      
                                  },
                                  child: SvgPicture.asset('assets/logo_facebook.svg', width: 48, height: 48,),
                                ),
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  )
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}