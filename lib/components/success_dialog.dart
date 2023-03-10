import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SuccessDialog extends StatelessWidget {

  const SuccessDialog({ Key? key, required this.widgetKey, required this.message }) : super(key: key);

  final Key widgetKey;
  final String message;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return AlertDialog(
      key: widgetKey,
      content: SizedBox(
        width: size.width * 0.8,
        height: size.height * 0.4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 64,
              backgroundColor: const Color(0xff0D64EF).withOpacity(0.2),
              child: const CircleAvatar(
                radius: 48,
                backgroundColor: Color(0xff0D64EF),
                child: Icon(Icons.done_sharp, color: Colors.white, size: 46,),
              ),
            ),
            const SizedBox(height: 25,),
            Text(message, style: GoogleFonts.poppins(
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ), textAlign: TextAlign.center,),
            const SizedBox(height: 25,),
            SizedBox(
              width: size.width * 0.8,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)
                  ),
                  backgroundColor: const Color(0xffFAA626),
                ),
                child: Text('OK', style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w600
                ),),
              ),
            )
          ],
        ),
      ),
    );
  }
}