// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TodoModel {
  String name;
  bool checked;
  DateTime createdAt;
  DateTime updatedAt;

  TodoModel({
    required this.name,
    required this.checked,
    required this.createdAt,
    required this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'checked': checked,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'updatedAt': updatedAt.millisecondsSinceEpoch,
    };
  }

  factory TodoModel.fromMap(Map<String, dynamic> map) {
    return TodoModel(
      name: map['name'] as String,
      checked: map['checked'] as bool,
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(map['updatedAt'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory TodoModel.fromJson(String source) =>
      TodoModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
