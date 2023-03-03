import 'package:flutter/material.dart';
import 'package:smart_cane/pages/home/home_widgets.dart';
import 'package:smart_cane/pages/settings/profile/profile_widgets.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottom(),
      appBar: appBar(context, "Login"),
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
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  const TextField(
                    decoration: InputDecoration(
                      hintText: "Email",
                    ),
                  ),
                  const SizedBox(height: 20),
                  const TextField(
                    decoration: InputDecoration(
                      hintText: "Password",
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/home');
                      },
                      child: const Text("Login"))
                  // Row(
                  //   children: [avatar(), info()],
                  // ),
                  // edit(),
                  // menu(context)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
