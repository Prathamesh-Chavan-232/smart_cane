import 'package:flutter/material.dart';
import 'package:smart_cane/common_utils/colors.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryBlue,
      appBar: AppBar(),
      body: Column(
        children: const [
          Center(child: Text("Smart Cane")),
        ],
      ),
    );
  }
}
