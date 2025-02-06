import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/todo/todo_provider.dart';
import 'package:provider_app/todo/todo_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TodoProvider()),
      ],
      child: TodoApp(),
    ),
  );
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: GoogleFonts.montserrat().fontFamily,
      ),
      debugShowCheckedModeBanner: false,
      home: TodoScreen(),
    );
  }
}
