import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:smart_cane/pages/settings/profile/profile_widgets.dart';

import '../../home/home_widgets.dart';
import 'more_widgets.dart';

class BlueTooth extends StatefulWidget {
  const BlueTooth({super.key});

  @override
  State<BlueTooth> createState() => _BlueToothState();
}

class _BlueToothState extends State<BlueTooth> {
  static String dropdownvalue = 'smart-cane-2';

  // List of items in our dropdown menu
  var items = [
    'smart-cane-1',
    'smart-cane-2',
    'smart-cane-3',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Bottom(),
      appBar: appBar(context, "Bluetooth"),
      body: Stack(
        children: [
          Container(
            constraints: const BoxConstraints.expand(),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    opacity: 0.3,
                    image: AssetImage("assets/background-circuit.png"),
                    fit: BoxFit.cover)),
          ),
          SingleChildScrollView(
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(right: 40.0, top: 20),
                child: Container(
                    alignment: Alignment.topRight, child: Dropdownbutton()),
              ),
              Img("assets/bluetooth.png"),
              Status(),
              Disconnect(),
            ]),
          ),
        ],
      ),
    );
  }

  Widget Dropdownbutton() {
    return DropdownButton(
      borderRadius: BorderRadius.circular(10),
      elevation: 40,
      value: dropdownvalue,
      icon: const Icon(
        Icons.add,
        size: 20,
      ),
      items: items.map((String items) {
        return DropdownMenuItem(
          value: items,
          child: Text(items),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          dropdownvalue = newValue!;
        });
      },
    );
  }
}
