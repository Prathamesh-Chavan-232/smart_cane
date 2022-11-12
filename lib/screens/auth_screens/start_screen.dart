import 'package:flutter/material.dart';
import 'package:smart_cane/common_utils/colors.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryBlue,
      appBar: AppBar(elevation: 0),
      body: Center(child: Image.asset('assets/smart-cane-logo.png')),
    );
  }
}
