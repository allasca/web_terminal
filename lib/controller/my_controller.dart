import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_terminal/ui/prefix_widget.dart';

class MyController extends GetxController {
  var responseText = [].obs;
  final inputText = TextEditingController(text: "");
  var focusText = FocusNode();

  addPrefixToResponse(String cmd) {
    responseText.add(
      Row(
        children: [
          const PrefixWidget(),
          const SizedBox(width: 6),
          Text(
            cmd,
            style: GoogleFonts.ubuntuMono(
              fontSize: 16,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }

  parseCommand(String text) {
    addPrefixToResponse(text);
    inputText.text = "";
    focusText.requestFocus();
    switch (text) {
      case "help":
        cmdHelp();
      case 'cls':
        cmdCLS();
      default:
    }
  }

  cmdHelp() {
    const text = '''
ABOUT                             Display about me.
CLS                               Clear screen.
HELP                              Provides help information for commands.''';
    responseText.add(
      Text(
        text,
        style: GoogleFonts.ubuntuMono(
          fontSize: 16,
          color: Colors.white,
        ),
      ),
    );
  }

  cmdCLS() {
    responseText.clear();
  }

}
