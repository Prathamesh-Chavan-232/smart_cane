import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smart_cane/globals.dart';
import 'package:syncfusion_flutter_maps/maps.dart';
import 'home_widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool mic = false;
  bool on = true;
  void swap() {
    setState(() {
      on = !on;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Bottom(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          backgroundColor: COLOR_THEME['secondary'],
          // shape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.all(Radius.circular(17))),
          onPressed: () {
            Fluttertoast.showToast(
              gravity: ToastGravity.CENTER,
              msg: mic ? "Recording Stopped..." : "Listening..",
              toastLength: Toast.LENGTH_SHORT,
              timeInSecForIosWeb: 1,
              backgroundColor: COLOR_THEME['secondary'],
              textColor: Colors.black,
              fontSize: 14.0,
            );
            setState(() {
              mic = !mic;
            });
          },
          child: Icon(
            size: 40,
            mic ? Icons.volume_up_outlined : Icons.mic,
            color: Colors.black,
          ),
        ),
        appBar: AppBar(
          centerTitle: false,
          title: Text(
            on ? "CONNECTED" : "DISCONNECTED",
            style: const TextStyle(
                color: Color.fromRGBO(200, 254, 251, 1), fontSize: 18),
          ),
          leading: Switch(
            value: on,
            onChanged: (value) => swap(),
            activeColor: COLOR_THEME['tertiary'],
            activeTrackColor: Colors.white38,
            inactiveThumbColor: Color.fromRGBO(249, 119, 119, 1.0),
            inactiveTrackColor: Colors.white38,
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/profile');
                },
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
          Body(),
        ]));
  }
}
