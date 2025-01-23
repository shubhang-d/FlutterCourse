import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
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
