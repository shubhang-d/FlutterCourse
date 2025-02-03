import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Logged in ho bhaisahab aap!"),
            IconButton(onPressed: () {
              FirebaseAuth.instance.signOut();
            },
             icon: Icon(Icons.logout)),
          ],
        ),
      )
    );
  }
}