import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_kop_sq_mobile/components/dynamic_size_button.dart';
import 'package:project_kop_sq_mobile/components/dynamic_snackbar.dart';
import 'package:project_kop_sq_mobile/components/regular_textfield.dart';
import 'package:project_kop_sq_mobile/cubit/forgot_password_cubit.dart';

class ForgotPasswordScreen extends StatelessWidget {

  const ForgotPasswordScreen({ Key? key }) : super(key: key);

  static final loginFormKey = GlobalKey<FormState>();

  @override
@override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final loginScreenCubit = context.read<ForgotPasswordCubit>();

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
                  height: size.height * 0.65,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Form(
                        key: loginFormKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Center(
                              child: CircleAvatar(
                                backgroundColor: Color(0xffE9F0FF),
                                radius: 36,
                                child: Icon(Icons.mail_sharp, size: 42, color: Color(0xff0D64EF),),
                              )
                            ),
                            const SizedBox(height: 15,),
                            Text('Masukan alamat E-mail mu', style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.white
                            ),),
                            const SizedBox(height: 8,),
                            Text('Kami akan mengirim link untuk mengganti password', style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xffffffff).withOpacity(0.7)
                            ), textAlign: TextAlign.center,),
                            const SizedBox(height: 20,),
                            RegularTextField(
                              widgetKey: const Key('email_field'),
                              label: 'E-Mail', 
                              controller: loginScreenCubit.emailController, 
                              validationMessage: '*Email harus diisi.'
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          DynamicSizeButton(
                            widgetKey: const Key('submit_login_button'),
                            label: 'Submit', 
                            buttonColor: const Color(0xffFAA626), 
                            onPressed: () {
                              if(loginFormKey.currentState!.validate()) {

                              } else {
                                showDynamicSnackBar(
                                  context, 
                                  Icons.error_sharp, 
                                  'ERROR', 
                                  'Email field harus diisi terlebih.', 
                                  Colors.red
                                );
                              }
                            }, 
                            width: size.width * 0.8,
                            height: 50,
                          ),
                          SizedBox(height: size.height * 0.05,),
                          GestureDetector(
                            onTap: () {
                              context.goNamed('/login');
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.arrow_back_sharp, size: 36, color: Colors.white,),
                                const SizedBox(width: 8,),
                                Text('Kembali ke Halaman Login', style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500
                                ),)
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