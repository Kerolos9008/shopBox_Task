import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastService {
  static void showUnExpectedErrorToast() {
    Fluttertoast.showToast(
      msg: "there has been an unexpected error please try again later",
      backgroundColor: Color(0xFFDC3545),
      textColor: Colors.white,
      fontSize: 18,
      timeInSecForIosWeb: 2,
    );
  }

  static void showErrorToast(String msg) {
    Fluttertoast.showToast(
      msg: msg,
      backgroundColor: Color(0xFFDC3545),
      textColor: Colors.white,
      fontSize: 18,
      timeInSecForIosWeb: 2,
    );
  }

  static void showSuccessToast(String msg) {
    Fluttertoast.showToast(
      msg: msg,
      backgroundColor: Colors.green[800],
      textColor: Colors.white,
      fontSize: 18,
      timeInSecForIosWeb: 2,
    );
  }
}
