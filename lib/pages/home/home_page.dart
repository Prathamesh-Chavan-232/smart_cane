import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:smart_cane/globals.dart';

import 'home_widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Bottom(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          backgroundColor: COLOR_THEME['secondary'],
          // shape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.all(Radius.circular(17))),
          onPressed: () {},
          child: Icon(
            size: 40,
            Icons.mic,
            color: Colors.black,
          ),
        ),
        appBar: AppBar(
          centerTitle: false,
          title: Text(
            "CONNECTED",
            style: TextStyle(
                color: Color.fromRGBO(200, 254, 251, 1), fontSize: 18),
          ),
          leading: Switch(
            value: true,
            onChanged: ((value) => false),
            activeColor: Color.fromRGBO(54, 91, 109, 1),
            activeTrackColor: Colors.white38,
            inactiveThumbColor: Color.fromARGB(255, 240, 99, 88),
            inactiveTrackColor: Colors.white38,
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  size: 35,
                  Icons.settings,
                  color: COLOR_THEME['tertiary'],
                )),
          ],
        ),
        body: Stack(children: [
          Container(
            constraints: const BoxConstraints.expand(),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    opacity: 0.5,
                    image: AssetImage("assets/background-circuit.png"),
                    fit: BoxFit.cover)),
          ),
          Body()
        ]));
  }
}
