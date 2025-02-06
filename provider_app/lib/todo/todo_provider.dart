import 'package:flutter/material.dart';

class TodoProvider extends ChangeNotifier {
  fetch() async {
    notifyListeners();
  }
}
