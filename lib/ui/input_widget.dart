import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_terminal/controller/my_controller.dart';
import 'package:web_terminal/ui/prefix_widget.dart';

class InputWidget extends StatelessWidget {
  const InputWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.find<MyController>();
    return Row(
      children: [
        const PrefixWidget(),
        const SizedBox(width: 6),
        Expanded(
          child: TextField(
            controller: c.inputText,
            cursorWidth: 12,
            cursorColor: Colors.white,
            focusNode: c.focusText,
            autofocus: true,
            textInputAction: TextInputAction.done,
            onSubmitted: (value) {
              c.parseCommand(value);
            },
            style: GoogleFonts.ubuntuMono(
              fontSize: 16,
              color: Colors.white,
            ),
            decoration: const InputDecoration(
              isDense: true,
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(bottom: 0, top: 0),
            ),
          ),
        ),
      ],
    );
  }
}
