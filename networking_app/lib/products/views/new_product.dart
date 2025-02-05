import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:networking_app/utils.dart';

class NewProductScreen extends StatefulWidget {
  const NewProductScreen({super.key});

  @override
  State<NewProductScreen> createState() => _NewProductScreenState();
}

class _NewProductScreenState extends State<NewProductScreen> {
  final TextEditingController _title = TextEditingController();
  final TextEditingController _price = TextEditingController();
  final TextEditingController _description = TextEditingController();
  final TextEditingController _image = TextEditingController();
  final TextEditingController _category = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.close,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                controller: _title,
                decoration: InputDecoration(labelText: 'Title'),
              ),
              TextFormField(
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                controller: _price,
                decoration: InputDecoration(labelText: 'Price'),
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                controller: _description,
                decoration: InputDecoration(labelText: 'Description'),
                maxLines: 3,
              ),
              TextFormField(
                controller: _image,
                decoration: InputDecoration(labelText: 'Image URL'),
              ),
              TextFormField(
                controller: _category,
                decoration: InputDecoration(labelText: 'Category'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  try {
                    Uri uri = Uri.parse("$baseUrl/products/6");
                    var r = await http.put(
                      uri,
                      body: jsonEncode({
                        "title": _title.text,
                        "price": num.parse(_price.text),
                        "description": _description.text,
                        "image": _image.text,
                        "category": _category.text,
                      }),
                    );

                    print(r.statusCode);
                    print(r.body);
                  } on Exception catch (e) {
                    print(e.toString());
                  }
                  // try {
                  //   Uri uri = Uri.parse("$baseUrl/products");
                  //   var r = await http.post(
                  //     uri,
                  //     body: jsonEncode({
                  //       "title": _title.text,
                  //       "price": num.parse(_price.text),
                  //       "description": _description.text,
                  //       "image": _image.text,
                  //       "category": _category.text,
                  //     }),
                  //   );

                  //   print(r.statusCode);
                  //   print(r.body);
                  // } on Exception catch (e) {
                  //   print(e.toString());
                  // }
                },
                child: Text('Add Product'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
