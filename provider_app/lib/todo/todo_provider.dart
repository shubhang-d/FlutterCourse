import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider_app/todo/todo_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TodoProvider extends ChangeNotifier {
  bool _isLoading = true;

  final LocalDataManager _dataManager = LocalDataManager();
  Map<String, TodoModel> todos = {};

  bool get isLoading => _isLoading;

  fetch() async {
    Map<String, dynamic> data = await _dataManager.read();

    todos = data.map(
      (key, value) {
        return MapEntry(
          key,
          TodoModel.fromJson(value as String),
        );
      },
    );

    _isLoading = false;
    notifyListeners();
  }

  addTodo(String name) {
    String id = DateTime.now().millisecondsSinceEpoch.toString();
    todos[id] = TodoModel(
      name: name,
      checked: false,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    _dataManager.write(todos);
    notifyListeners();
  }

  toggleTodo({
    required String id,
    required bool value,
  }) {
    if (todos[id] != null) {
      todos[id]!.checked = value;
      _dataManager.write(todos);
      notifyListeners();
    }
  }

  removeToDo(String id) {
    todos.remove(id);
    _dataManager.write(todos);
    notifyListeners();
  }
}

class LocalDataManager {
  write(Map<String, TodoModel> data) async {
    SharedPreferences store = await SharedPreferences.getInstance();
    store.setString('data', jsonEncode(data));
  }

  Future<Map<String, dynamic>> read() async {
    SharedPreferences store = await SharedPreferences.getInstance();
    String rawData = store.getString('data') ?? "{}";

    return jsonDecode(rawData);
  }
}
