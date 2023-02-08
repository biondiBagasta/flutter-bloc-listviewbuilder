import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PasswordTextField extends StatelessWidget {

  const PasswordTextField({ Key? key, required this.controller,
  required this.validationMessage, required this.label, required this.isShowedPassword,
  required this.showPassword, required this.widgetKey }) : super(key: key);

  final TextEditingController controller;
  final String validationMessage;
  final String label;
  final bool isShowedPassword;
  final Function showPassword;
  final Key widgetKey;

  @override
  Widget build(BuildContext context) {
    return Column(
      key: widgetKey,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: GoogleFonts.poppins(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: Colors.white
        ),),
        const SizedBox(height: 4,),
        Container(
          padding: const EdgeInsets.fromLTRB(10,2,10,2),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Colors.grey),
              color: Colors.white
          ),
          child: TextFormField(
            style: GoogleFonts.poppins(
              fontSize: 17,
              fontWeight: FontWeight.w500
            ),
            controller: controller,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            obscureText: isShowedPassword == true ? false : true,
            decoration: InputDecoration(
              hintText: label,
              labelStyle: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                fontSize: 17
              ),
              border: InputBorder.none,
              suffixIcon: GestureDetector(
                onTap: () {
                  showPassword();
                },
                child: isShowedPassword == true ? const Icon(Icons.visibility_off_outlined) : const Icon(Icons.visibility_outlined),
              ),
              errorStyle: const TextStyle(
                fontSize: 16
              )
            ),
            validator: (value) {
              if(value!.isEmpty) {
                return validationMessage;
              } else {
                return null;
              }
            },
          ),
        ),
      ],
    );
  }
}