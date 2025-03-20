import 'package:flutter/material.dart';

class GlobalModel with ChangeNotifier {
  // user data

  Future<bool> Login({required String name, required String password}) async {
    // log in
    return true;
  }
  Future<bool> Signup({required String name, required String password}) async {
    // sign up
    return true;
  }
}