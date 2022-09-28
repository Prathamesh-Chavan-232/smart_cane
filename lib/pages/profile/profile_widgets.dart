import 'package:flutter/material.dart';
import 'package:smart_cane/globals.dart';

Widget Avatar() {
  return const Padding(
    padding: EdgeInsets.only(top: 40.0, left: 20, right: 10),
    child: CircleAvatar(
      backgroundColor: Colors.transparent,
      backgroundImage: AssetImage("assets/profile.png"),
      radius: 75,
    ),
  );
}

Widget Info() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(bottom: 10, top: 30),
        child: Text(
          "Rohit Sharma",
          style: TextStyle(
              color: COLOR_THEME['tertiary'],
              fontSize: 25,
              fontWeight: FontWeight.bold),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(2.0),
        child: Text("Contact  7875345320",
            style: TextStyle(
                color: COLOR_THEME['tertiary'],
                fontSize: 15,
                fontWeight: FontWeight.w500)),
      ),
      Padding(
        padding: const EdgeInsets.all(2.0),
        child: Text("Blindness type:  Sever",
            style: TextStyle(
                color: COLOR_THEME['tertiary'],
                fontSize: 15,
                fontWeight: FontWeight.w500)),
      )
    ],
  );
}

Widget Edit() {
  return Padding(
      padding: const EdgeInsets.only(left: 8.0, bottom: 40),
      child: Container(
          height: 35,
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
              "Edit Profile",
              style: TextStyle(
                color: COLOR_THEME['tertiary'],
              ),
            ),
          )));
}

Widget Logout() {
  return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Container(
          height: 35,
          width: 150,
          child: ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.red[100]!),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: const BorderSide(color: Colors.red)))),
            child: const Text(
              "Logout",
              style: TextStyle(
                color: Colors.red,
              ),
            ),
          )));
}

Widget Menu() {
  return Column(
    children: [
      const Padding(
        padding: EdgeInsets.only(left: 20.0, right: 20),
        child: Divider(
          thickness: 2,
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: const [
            Icon(
              Icons.bluetooth,
              size: 35,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "Bluetooth Setting",
              style: TextStyle(fontSize: 18),
            )
          ],
        ),
      ),
      const Padding(
        padding: EdgeInsets.only(left: 20.0, right: 20),
        child: Divider(
          thickness: 2,
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          children: const [
            Icon(Icons.call, size: 35),
            SizedBox(
              width: 10,
            ),
            Text(
              "Emergency Calls",
              style: TextStyle(fontSize: 18),
            )
          ],
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
