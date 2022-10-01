import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:smart_cane/pages/settings/profile/profile_widgets.dart';

import '../../home/home_widgets.dart';
import 'more_widgets.dart';

class EmergencyCalls extends StatefulWidget {
  const EmergencyCalls({super.key});

  @override
  State<EmergencyCalls> createState() => _EmergencyCallsState();
}

class _EmergencyCallsState extends State<EmergencyCalls> {
  static String dropdownvalue = 'Add contact';

  // List of items in our dropdown menu
  var items = [
    'Add contact',
    'contact-1',
    'contact-2',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, "Emergency Calls"),
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
              Img("assets/emergency.png"),
              Contacts(),
              Editcontacts(),
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
