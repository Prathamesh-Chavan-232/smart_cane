import 'package:flutter/material.dart';
import 'package:smart_cane/globals.dart';

Widget Disconnect(bool connected) {
  return Padding(
      padding: const EdgeInsets.all(10),
      child: SizedBox(
          height: 35,
          width: 300,
          child: ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    connected ? Colors.red[100]! : Colors.green[100]!),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        side: BorderSide(
                            color: connected ? Colors.red : Colors.green)))),
            child: Text(
              connected ? "DISCONNECT" : "CONNECT",
              style: TextStyle(
                color: connected ? Colors.red : Colors.green,
              ),
            ),
          )));
}

Widget Img(String img) {
  return Padding(
    padding: const EdgeInsets.all(8),
    child: Stack(
      children: [
        const Image(
          image: AssetImage("assets/spiral_background.png"),
        ),
        Padding(
            padding: const EdgeInsets.only(top: 100, left: 60),
            child: Image(image: AssetImage(img))),
      ],
    ),
  );
}

Widget Status(bool connected) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Padding(
        padding: const EdgeInsets.only(bottom: 10, top: 30),
        child: Text(
          connected ? "Status : CONNECTED" : "Status : NOT CONNECTED",
          style: TextStyle(
              color: COLOR_THEME['tertiary'],
              fontSize: 22,
              fontWeight: FontWeight.bold),
        ),
      ),
      connected
          ? Padding(
              padding: const EdgeInsets.all(2.0),
              child: Text("Smart Cane - 20099CE",
                  style: TextStyle(
                    color: COLOR_THEME['tertiary'],
                    fontSize: 22,
                  )),
            )
          : Padding(
              padding: const EdgeInsets.all(2.0),
              child: Text("Connect a Device",
                  style: TextStyle(
                    color: COLOR_THEME['tertiary'],
                    fontSize: 22,
                  )),
            ),
      connected
          ? const Padding(
              padding: EdgeInsets.all(2.0),
              child: Text("Connection Strong",
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 17,
                  )),
            )
          : const Padding(
              padding: EdgeInsets.all(2.0),
              child: Text("Pair with a new device from bluetooth settings",
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 17,
                  )),
            )
    ],
  );
}

Widget Editcontacts() {
  return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 40),
      child: SizedBox(
          height: 40,
          width: 300,
          child: ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(COLOR_THEME['secondary']!),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        side: BorderSide(color: COLOR_THEME['primary']!)))),
            child: Text(
              "Edit contact list",
              style: TextStyle(
                color: COLOR_THEME['tertiary'],
              ),
            ),
          )));
}

Widget Contacts() {
  return Column(
    children: [
      const Padding(
        padding: EdgeInsets.only(left: 20.0, right: 20),
        child: Divider(
          thickness: 2,
        ),
      ),
      InkWell(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: const [
              Text(
                "Contact 1 :",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "7896451235",
                style: TextStyle(fontSize: 18),
              )
            ],
          ),
        ),
      ),
      const Padding(
        padding: EdgeInsets.only(left: 20.0, right: 20),
        child: Divider(
          thickness: 2,
        ),
      ),
      InkWell(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            children: const [
              Text(
                "Contact 2 :",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "7875345326",
                style: TextStyle(fontSize: 18),
              )
            ],
          ),
        ),
      ),
      const Padding(
        padding: EdgeInsets.only(left: 20.0, right: 20),
        child: Divider(
          thickness: 2,
        ),
      ),
    ],
  );
}
