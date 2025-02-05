import 'package:flutter/material.dart';
import 'package:networking_app/products/models/product_model.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key, required this.productModel});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();

  final ProductModel productModel;
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Center(
            child: Hero(
              tag: Key(widget.productModel.id.toString()),
              child: Image.network(
                widget.productModel.image,
                width: 200,
                height: 200,
              ),
            ),
          ),
          Text(widget.productModel.title),
          Text(widget.productModel.description),
        ],
      ),
    );
  }
}
