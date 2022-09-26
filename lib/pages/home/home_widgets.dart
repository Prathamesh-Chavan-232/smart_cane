import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:smart_cane/globals.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(top: 20),
      child: Column(
        children: [
          Container(color: COLOR_THEME['secondary'], height: 112),
          SizedBox(
            height: 20,
          ),
          Container(color: Color.fromRGBO(200, 254, 251, 1), height: 300),
          SizedBox(height: 20),
          Container(
            color: Color.fromRGBO(95, 205, 67, 0.2),
            height: 60,
          ),
          SizedBox(height: 20),
          Container(
            color: Color.fromRGBO(255, 244, 187, 1),
            height: 90,
          ),
          SizedBox(height: 10),
          Container(
            color: Color.fromRGBO(200, 231, 254, 1),
            height: 90,
          )
        ],
      ),
    );
  }
}

Widget Bottom() {
  return BottomAppBar(
      elevation: 0.2,
      notchMargin: 7,
      clipBehavior: Clip.antiAlias,
      color: COLOR_THEME['primary'],
      child: SizedBox(
        width: double.infinity,
        height: 60,
      ));
}
