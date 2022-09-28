// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:smart_cane/globals.dart';
import 'package:smart_cane/pages/profile/profile_widgets.dart';

import '../home/home_widgets.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Bottom(),
      floatingActionButton: Logout(),
      appBar: AppBar(
          title: const Text(
            "Settings / Profile",
            style: TextStyle(
                color: Color.fromRGBO(200, 254, 251, 1), fontSize: 18),
          ),
          leading: IconButton(
            iconSize: 35,
            icon: const Icon(Icons.turn_left),
            color: COLOR_THEME['tertiary'],
            onPressed: () => Navigator.of(context)..pop(),
          )),
      body: Column(
        children: [
          Row(
            children: [Avatar(), Info()],
          ),
          Edit(),
          Menu()
        ],
      ),
    );
  }
}
