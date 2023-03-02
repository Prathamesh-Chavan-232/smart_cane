import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:smart_cane/common_utils/colors.dart';
import 'package:smart_cane/connect_blue_serial.dart';
import 'package:smart_cane/connect_bluetooth/home.dart';
import 'package:smart_cane/pages/settings/more/bluetooth.dart';
import 'package:smart_cane/pages/settings/more/emergency_calls.dart';
import 'package:smart_cane/pages/settings/profile/profile_page.dart';
import 'package:smart_cane/screens/auth_screens/start_screen.dart';
import 'globals.dart';
import 'pages/home/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: APP_TITLE,
      theme: ThemeData(
        brightness: Brightness.light,
        colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: primaryBlue,
              secondary: primaryColor,
            ),
        buttonTheme: Theme.of(context)
            .buttonTheme
            .copyWith(buttonColor: const Color(0xFFC1F0F6)),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        textTheme: DEFAULT_TEXT_THEME,
      ),
      themeMode: ThemeMode.light,
      initialRoute: '/dev',
      routes: {
        '/dev': (_) => const ConnectBlueSerial(),
        '/connect_arduino': (_) => const ConnectArduino(),
        '/start': (_) => const StartScreen(),
        '/home': (_) => const HomePage(),
        '/profile': (_) => const ProfilePage(),
        '/bluetooth': (_) => const BlueTooth(),
        '/emergency': (_) => const EmergencyCalls(),
      },
    );
  }
}
