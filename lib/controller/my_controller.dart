import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_terminal/ui/prefix_widget.dart';

class MyController extends GetxController {
  var responseText = [].obs;
  final inputText = TextEditingController(text: "");
  var focusText = FocusNode();
  ScrollController scrollController = ScrollController();

  addPrefixToResponse(String cmd) {
    responseText.add(
      Row(
        children: [
          const PrefixWidget(),
          const SizedBox(width: 6),
          responseTemplate(cmd),
        ],
      ),
    );
  }

  parseCommand(String text) async {
    addPrefixToResponse(text);
    switch (text) {
      case "help":
        cmdHelp();
      case 'cls':
        cmdCLS();
      case 'about':
        cmdAbout();
      case 'info':
        cmdInfo();
      case 'mutiara':
        cmdMutiara();
      case 'dimar':
        cmdDimar();
      default:
        cmdWrong(text);
    }
    inputText.text = "";
    focusText.requestFocus();
    await Future.delayed(const Duration(milliseconds: 600));
    scrollController.animateTo(scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  cmdHelp() {
    const text = '''
ABOUT               Display about me.
CLS                 Clear screen.
HELP                Provides help information for commands.
INFO                Get current device information.''';
    responseText.add(responseTemplate(text));
  }

  cmdDimar() {
    const text = '''
            .-"''-.  _
          .'       `( \\ 
        @/            ')   ,--,__,-"
        /        /      \\ /     /   _/
      __|           ,   |/         /
    .~  `\\   / \\ ,  |   /
  .~      `\\    `  /  _/   _/
.~          `\\  ~~`__/    /
~             `--'/
             /   /    /
            /  /'    /''';
    responseText.add(responseTemplate(text));
  }

  cmdMutiara() {
    const text = '''
⠀⣠⣤⣶⣶⣦⣄⡀⠀⢀⣤⣴⣶⣶⣤⣀⠀
⣼⣿⣿⣿⣿⣿⣿⣷⣤⣾⣿⣿⣿⣿⣿⣿⣧
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⠹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠏
⠀⠙⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠋⠀
⠀⠀⠀⠙⢿⣿⣿⣿⣿⣿⣿⣿⡿⠛⠁⠀⠀
⠀⠀⠀⠀⠀⠉⢿⣿⣿⣿⠟⠋⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠙⠻⠁⠀⠀⠀⠀⠀⠀⠀''';
    responseText.add(responseTemplate(text));
  }

  cmdInfo() async {
    final deviceInfoPlugin = DeviceInfoPlugin();
    final deviceInfo = await deviceInfoPlugin.webBrowserInfo;
    var text = '''
APPCODENAME    ${deviceInfo.appCodeName}
APPNAME        ${deviceInfo.appName}
APPVERSION     ${deviceInfo.appVersion}
USERAGENT      ${deviceInfo.userAgent}
PLATFORM       ${deviceInfo.platform}''';
    responseText.add(responseTemplate(text));
  }

  cmdAbout() {
    const text = '''
NAME           allasca
LOCATION       allasca.github.io
EMAIL          y.allasca@gmail.com''';
    responseText.add(responseTemplate(text));
  }

  cmdWrong(String value) {
    if (value.isEmpty) return;
    var text = "Command '$value' not found. hehehee.";
    responseText.add(responseTemplate(text));
  }

  cmdCLS() {
    responseText.clear();
  }

  responseTemplate(String text) {
    return Text(
      text,
      style: GoogleFonts.ubuntuMono(
        fontSize: 16,
        color: Colors.white,
      ),
    );
  }
}
