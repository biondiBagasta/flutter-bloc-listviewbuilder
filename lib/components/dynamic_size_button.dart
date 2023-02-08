import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DynamicSizeButton extends StatelessWidget {

  const DynamicSizeButton({ Key? key, required this.label,
  required this.buttonColor, required this.onPressed, required this.width,
  required this.height, required this.widgetKey }) : super(key: key);

  final String label;
  final double width;
  final double height;
  final Color buttonColor;
  final Function onPressed;
  final Key widgetKey;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      key: widgetKey,
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: () {
          onPressed();
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8)
          ),
          backgroundColor: buttonColor,
        ),
        child: Text(label, style: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.w700
        ),),
      ),
    );
  }
}