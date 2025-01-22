import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_app/views/home_view.dart';

class FormView extends StatefulWidget {
  const FormView({super.key});

  @override
  State<FormView> createState() => _FormViewState();
}

class _FormViewState extends State<FormView> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        toolbarHeight: 0,
      ),
      body: SafeArea(
        top: false,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 32,
            vertical: 12,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 48),
                Text(
                  "Registration Form",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 64),
                TextFormField(
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter a value";
                    }

                    if (value.length < 3) {
                      return "Must have at least 3 characters";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    // prefixIcon: Icon(CupertinoIcons.home),
                    hintText: "User Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 18,
                    ),
                    fillColor: Colors.grey[200],
                    filled: true,
                  ),
                ),
                SizedBox(height: 16),
                TextFormField(
                  obscureText: true,
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter a value";
                    }

                    if (value.length < 6) {
                      return "Must have at least 6 characters";
                    }
                    return null;
                  },
                  obscuringCharacter: "*",
                  decoration: InputDecoration(
                    // prefixIcon: Icon(CupertinoIcons.home),
                    hintText: "Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 18,
                    ),
                    fillColor: Colors.grey[200],
                    filled: true,
                  ),
                ),
                SizedBox(height: 16),
                TextFormField(
                  maxLines: 5,
                  decoration: InputDecoration(
                    // prefixIcon: Icon(CupertinoIcons.home),
                    hintText: "Address",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 18,
                    ),
                    fillColor: Colors.grey[200],
                    filled: true,
                  ),
                ),
                SizedBox(height: 56),
                FilledButton(
                  onPressed: () {
                    primaryFocus?.unfocus();

                    if (_formKey.currentState!.validate()) {
                      print("Form is valid");

                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => HomeView(),
                        ),
                      );
                    } else {
                      print("Form is invalid");
                    }
                  },
                  child: Text("Press Me"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
