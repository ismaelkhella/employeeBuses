import 'package:flutter/material.dart';

mixin Helper {
  void showSnackBar(
      {required BuildContext Context,
      required String message,
      bool error = false,}) {
    ScaffoldMessenger.of(Context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: error ? Colors.red : Colors.green,
        behavior: SnackBarBehavior.floating,
        dismissDirection: DismissDirection.horizontal,
      ),
    );
  }
}
