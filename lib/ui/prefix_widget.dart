import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PrefixWidget extends StatelessWidget {
  const PrefixWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: "allasca@flutter-web",
        style: GoogleFonts.ubuntuMono(
          fontSize: 16,
          color: Colors.green[300],
        ),
        children: [
          TextSpan(
            text: ":",
            style: GoogleFonts.ubuntuMono(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          TextSpan(
            text: "~",
            style: GoogleFonts.ubuntuMono(
              fontSize: 16,
              color: Colors.blue[300],
            ),
          ),
          TextSpan(
            text: "\$",
            style: GoogleFonts.ubuntuMono(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
