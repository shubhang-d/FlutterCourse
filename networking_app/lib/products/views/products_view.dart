import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:networking_app/products/models/product_model.dart';
import 'package:networking_app/utils.dart';

class ProductsView extends StatefulWidget {
  const ProductsView({super.key});

  @override
  State<ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView> {
  List<ProductModel> products = [];
  bool isLoading = true;

  callApi() async {
    Uri uri = Uri.parse("$baseUrl/products");
    var r = await http.get(uri);

    if (r.statusCode == 200) {
      for (Map<String, dynamic> p in (jsonDecode(r.body) as List<dynamic>)) {
        ProductModel productModel = ProductModel(
          id: p['id'] as int,
          title: p['title'] as String,
          price: p['price'] as num,
          description: p['description'] as String,
          image: p['image'] as String,
          rating: RatingModel(
            rate: p['rating']['rate'] as num,
            count: p['rating']['count'] as int,
          ),
        );

        products.add(productModel);
      }

      isLoading = false;
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    callApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  ProductModel productModel = products[index];

                  return ListTile(
                    title: Text(productModel.title),
                    subtitle: Text(productModel.description),
                    leading: Image.network(productModel.image),
                  );
                },
              ),
      ),
    );
  }
}
