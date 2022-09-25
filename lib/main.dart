import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    // if (kIsWeb) {
    //   await Firebase.initializeApp(
    //       options: const FirebaseOptions(
    //     apiKey: "AIzaSyDHuOP7EBs6BIDUeN2Q2fq_1_Im-Pt12SY",
    //     appId: "1:1077591921022:web:8ec2bba3fb6878bca3a32f",
    //     messagingSenderId: "1077591921022",
    //     projectId: "instagram-clone-7cd9a",
    //     storageBucket: "instagram-clone-7cd9a.appspot.com",
    //   ));
    // } else {
    //   await Firebase.initializeApp();
    // }

    // await Firebase.initializeApp();
    runApp(const MyApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
