import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Future displayToast(String toastMsg) async {
  await Fluttertoast.showToast(
      msg: toastMsg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black.withOpacity(0.6),
      textColor: Colors.white,
      fontSize: 14.0);
}

