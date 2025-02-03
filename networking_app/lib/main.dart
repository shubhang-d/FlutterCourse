import 'package:flutter/material.dart';
import 'package:networking_app/products/views/products_view.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ProductsView(),
    );
  }
}
