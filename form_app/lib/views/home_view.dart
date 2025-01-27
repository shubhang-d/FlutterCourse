import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_app/widgets/app_drawer.dart';
import 'package:iconsax/iconsax.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _sKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _sKey,
      drawer: AppDrawer(),
      floatingActionButton: FloatingActionButton(
        elevation: 20,
        onPressed: () {
          // showDialog(
          //   context: context,
          //   builder: (context) {
          //     return AlertDialog(
          //       title: Text("Loading..."),
          //       content: Text("Your app is loading please standby."),
          //       actions: [
          //         TextButton(
          //           onPressed: () {
          //             Navigator.pop(context);
          //           },
          //           child: Text("Ok"),
          //         ),
          //       ],
          //     );
          //   },
          // );

          showCupertinoDialog(
            context: context,
            builder: (context) {
              return CupertinoAlertDialog(
                title: Text("Loading..."),
                content: Text("Your app is loading please standby"),
                actions: [
                  CupertinoDialogAction(
                    isDefaultAction: true,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Ok"),
                  ),
                  CupertinoDialogAction(
                    isDestructiveAction: true,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Cancel"),
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Iconsax.refresh),
      ),
      appBar: AppBar(
        // leading: IconButton(
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        //   icon: Icon(Icons.arrow_back),
        // ),
        leading: IconButton(
          onPressed: () {
            _sKey.currentState?.openDrawer();
          },
          icon: Icon(Iconsax.menu5),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 100,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.blue,
                    ),
                  ),
                  Container(
                    width: 80,
                    color: Colors.yellow,
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),
            SizedBox(
              height: 100,
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      color: Colors.blue,
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      color: Colors.yellow,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),
            SizedBox(
              height: 100,
              child: Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Container(
                      color: Colors.blue,
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      color: Colors.yellow,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),
            SizedBox(
              height: 100,
              child: Row(
                children: [
                  Spacer(flex: 3),
                  Container(
                    width: 100,
                    color: Colors.blue,
                  ),
                  Spacer(),
                  Container(
                    width: 100,
                    color: Colors.yellow,
                  ),
                  Spacer(
                    flex: 3,
                  ),
                ],
              ),
            ),
            // Spacer(),
            Container(
              height: 80,
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}
