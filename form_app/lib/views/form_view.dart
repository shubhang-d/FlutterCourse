import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';

import 'home_view.dart';

class FormView extends StatefulWidget {
  const FormView({super.key});

  @override
  State<FormView> createState() => _FormViewState();
}

class _FormViewState extends State<FormView> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  bool _isPasswordVisible = false;
  bool _keepSigndIn = false;
  String? _gender;

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
                  obscureText: !_isPasswordVisible,
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
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      },
                      icon: Icon(
                        _isPasswordVisible ? Iconsax.eye_slash : Iconsax.eye,
                      ),
                    ),
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
                Row(
                  children: [
                    Checkbox(
                      value: _keepSigndIn,
                      onChanged: (value) {
                        setState(() {
                          _keepSigndIn = value!;
                        });
                      },
                    ),
                    // Radio(
                    //   groupValue: _keepSigndIn,
                    //   value: true,
                    //   onChanged: (value) {
                    //     setState(() {
                    //       _keepSigndIn = value!;
                    //     });
                    //   },
                    // ),
                    // Radio(
                    //   groupValue: _keepSigndIn,
                    //   value: false,
                    //   onChanged: (value) {
                    //     setState(() {
                    //       _keepSigndIn = value!;
                    //     });
                    //   },
                    // ),
                    TextButton(
                      style: TextButton.styleFrom(padding: EdgeInsets.zero),
                      onPressed: () {
                        setState(() {
                          _keepSigndIn = !_keepSigndIn;
                        });
                      },
                      child: Text("Keep me signed in"),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Radio(
                            value: "Male",
                            groupValue: _gender,
                            onChanged: (value) {
                              setState(() {
                                _gender = "Male";
                              });
                            },
                          ),
                          Text("Male"),
                        ],
                      ),
                    ),
                    // Spacer(),
                    Expanded(
                      child: Row(
                        children: [
                          Radio(
                            value: "Female",
                            groupValue: _gender,
                            onChanged: (value) {
                              setState(() {
                                _gender = "Female";
                              });
                            },
                          ),
                          Text("Female"),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 56),
                FilledButton(
                  onPressed: () async {
                    primaryFocus?.unfocus();

                    if (_gender == null) {
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          duration: Duration(seconds: 8),
                          backgroundColor: Colors.red,
                          action: SnackBarAction(
                            label: "OK",
                            onPressed: () {
                              print("Ok PRessed");

                              ScaffoldMessenger.of(context)
                                  .hideCurrentSnackBar();
                            },
                          ),
                          content: Text("Please select your gender"),
                        ),
                      );
                    }

                    if (_formKey.currentState!.validate() && _gender != null) {
                      setState(() {
                        _isLoading = true;
                      });

                      await Future.delayed(Duration(seconds: 2));

                      setState(() {
                        _isLoading = false;
                      });

                      print("Form is valid");

                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (_) => HomeView(),
                        ),
                      );
                    } else {
                      print("Form is invalid");
                    }
                  },
                  child: Text(_isLoading ? "Loading.." : "Press Me"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
