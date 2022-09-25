import 'package:flutter/material.dart';

class ResponsiveLayout extends StatefulWidget {
  final Widget webScreen;
  final Widget mobileScreen;
  const ResponsiveLayout(
      {required this.webScreen, required this.mobileScreen, Key? key})
      : super(key: key);

  @override
  State<ResponsiveLayout> createState() => _ResponsiveLayoutState();
}

class _ResponsiveLayoutState extends State<ResponsiveLayout> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: ((context, constraints) {
      if (constraints.maxWidth > webScreenSize) {
        return widget.webScreen;
        // Web layout
      } else {
        return widget.mobileScreen;
      }
      // else mobile layout
    }));
  }
}
