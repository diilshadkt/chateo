import 'package:chateo/main.dart';
import 'package:flutter/material.dart';

class SnackbarUtils {
  static void showMessage(String message) {
    MyApp.scaffoldMessengerKey.currentState!
        .showSnackBar( SnackBar(content: Text(message)));
  }
}
