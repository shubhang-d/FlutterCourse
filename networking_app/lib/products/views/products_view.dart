import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:networking_app/products/models/product_model.dart';
import 'package:networking_app/products/views/new_product.dart';
import 'package:networking_app/products/views/product_detail.dart';
import 'package:networking_app/utils.dart';

class ProductsView extends StatefulWidget {
  const ProductsView({super.key});

  @override
  State<ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView> {
  String? selected;
  List<ProductModel> allProducts = [];
  List<ProductModel> products = [];
  List<String> categories = [];
  bool isLoading = true;

  Future<void> fetchCategories() async {
    Uri uri = Uri.parse("$baseUrl/products/categories");
    var r = await http.get(uri);

    if (r.statusCode == 200) {
      categories = List<String>.from(jsonDecode(r.body) as List<dynamic>);
    }
  }

  Future<void> fetchProducts() async {
    Uri uri = Uri.parse("$baseUrl/products");
    var r = await http.get(uri);

    if (r.statusCode == 200) {
      for (Map<String, dynamic> p in (jsonDecode(r.body) as List<dynamic>)) {
        ProductModel productModel = ProductModel.fromMap(p);

        allProducts.add(productModel);
      }
    }

    products = allProducts;
  }

  callApi() async {
    setState(() {
      isLoading = true;
    });

    await fetchCategories();
    await fetchProducts();

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    callApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple.shade200,
        title: Text("Amazon"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            CupertinoModalPopupRoute(
              builder: (context) => NewProductScreen(),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 80,
            child: ListView.separated(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 20,
              ),
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              separatorBuilder: (context, index) => SizedBox(width: 10),
              itemBuilder: (context, index) => ActionChip(
                backgroundColor:
                    selected == categories[index] ? Colors.deepPurple : null,
                onPressed: () {
                  products = allProducts
                      .where((element) => element.category == selected)
                      .toList();

                  setState(() {
                    selected = categories[index];
                  });

                  setState(() {});
                },
                label: Text(categories[index]),
              ),
            ),
          ),
          isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Expanded(
                  child: GridView.builder(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),
                    itemCount: products.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                      mainAxisExtent: 230,
                    ),
                    itemBuilder: (context, index) {
                      ProductModel productModel = products[index];

                      return Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black.withValues(alpha: .1),
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          children: [
                            Hero(
                              tag: Key(productModel.id.toString()),
                              child: Image.network(
                                productModel.image,
                                height: 80,
                              ),
                            ),
                            SizedBox(height: 20),
                            Text(
                              productModel.title,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Spacer(),
                            Row(
                              children: [
                                FilledButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            ProductDetailScreen(
                                                productModel: productModel),
                                      ),
                                    );
                                  },
                                  child: Text("Buy Now"),
                                ),
                                SizedBox(width: 8),
                                Row(
                                  children: [
                                    Icon(Icons.star),
                                    Text(
                                      productModel.rating.rate
                                          .toStringAsFixed(1),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      );

                      // return ListTile(
                      //   title: Text(productModel.title),
                      //   subtitle: Text(productModel.description),
                      //   leading: Image.network(productModel.image),
                      // );
                    },
                  ),
                ),
        ],
      ),
    );
  }
}

class FadePageRoute<T> extends PageRoute<T> {
  FadePageRoute(this.child);
  @override
  Color get barrierColor => Color(0xFFD0D4E3);

  final Widget child;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 800);

  @override
  String? get barrierLabel => Color(0xFFD0D4E3).toString();
}

class FadePage<T> extends Page<T> {
  const FadePage({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Route<T> createRoute(BuildContext context) {
    return FadePageRoute<T>(child);
  }
}
