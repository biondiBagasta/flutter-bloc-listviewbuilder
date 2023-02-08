import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegularTextField extends StatelessWidget {

  const RegularTextField({ Key? key, required this.label, required this.controller,
  required this.validationMessage, required this.widgetKey }) : super(key: key);

  final TextEditingController controller;
  final String label;
  final String validationMessage;
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
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: label,
              hintStyle: GoogleFonts.poppins(
                fontSize: 17,
                fontWeight: FontWeight.w400
              ),
              floatingLabelBehavior: FloatingLabelBehavior.never,
              errorStyle: const TextStyle(
                fontSize: 16
              ),
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