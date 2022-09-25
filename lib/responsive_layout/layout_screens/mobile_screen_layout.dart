import 'package:flutter/material.dart';

class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({Key? key}) : super(key: key);

  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {
  String username = "";
  @override
  void initState() {
    getUserData();
    super.initState();
  }

  void getUserData() async {
    UserModel userData = await FirestoreMethods().getUserData();
    setState(() {
      username = userData.username;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            actions: const [],
          ),
          body: body: const Center(child: Text('This is a mobile'))),
    );
  }
}
