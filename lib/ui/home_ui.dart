import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_terminal/controller/my_controller.dart';
import 'package:web_terminal/ui/input_widget.dart';

class HomeUI extends StatelessWidget {
  const HomeUI({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.put(MyController());
    return GestureDetector(
      onTap: () => c.focusText.requestFocus(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...List.generate(
                  c.responseText.length,
                  (int i) => c.responseText[i],
                ).toList(),
                const SizedBox(height: 3),
                const InputWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
