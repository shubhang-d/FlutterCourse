import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider_app/todo/new_todo.dart';
import 'package:provider_app/utils.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryColor,
        onPressed: () {
          // Navigator.push(
          //   context,
          //   CupertinoModalPopupRoute(
          //     builder: (context) => NewTodoScreen(),
          //   ),
          // );

          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) => NewTodoScreen(),
          );
        },
        child: Icon(
          Iconsax.add,
          color: Colors.white,
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/bg.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Container(
              color: AppColors.creamColor.withValues(
                alpha: .4,
              ),
            ),
          ),
          Positioned.fill(
            child: ListView.separated(
              padding: EdgeInsets.only(
                top: 160,
                left: 24,
                right: 24,
              ),
              itemCount: 20,
              separatorBuilder: (context, index) => SizedBox(height: 10),
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: .3),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withValues(alpha: .1),
                        blurStyle: BlurStyle.outer,
                        blurRadius: 40,
                      )
                    ],
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 12),
                      Icon(IconlyLight.tickSquare),
                      SizedBox(width: 18),

                      // Checkbox(
                      //   value: true,
                      //   onChanged: (value) {},
                      // ),
                      Expanded(
                          child: Text(
                              "This is a dummy task you have to do this.")),
                      // IconButton(
                      //   onPressed: () {},
                      //   icon: Icon(
                      //     Icons.remove,
                      //   ),
                      // ),
                    ],
                  ),
                );
              },
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                child: Container(
                  padding: EdgeInsets.only(
                    left: 20,
                    right: 20,
                    bottom: 30,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: .5),
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(40),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: MediaQuery.of(context).padding.top),
                      Text(
                        "Hello John",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                      Text(
                        "Welcome Back!",
                        style: TextStyle(
                          fontSize: 16,
                          fontStyle: FontStyle.italic,
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
