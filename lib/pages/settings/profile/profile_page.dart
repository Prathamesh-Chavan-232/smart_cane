// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:smart_cane/pages/settings/profile/profile_widgets.dart';

import '../../home/home_widgets.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottom(),
      floatingActionButton: logout(context),
      appBar: appBar(context, "Settings / Profile"),
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
            child: Column(
              children: [
                Row(
                  children: [avatar(), info()],
                ),
                edit(),
                menu(context)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
