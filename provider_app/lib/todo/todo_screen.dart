import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/todo/new_todo.dart';
import 'package:provider_app/todo/todo_model.dart';
import 'package:provider_app/todo/todo_provider.dart';
import 'package:provider_app/utils.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<TodoProvider>(context, listen: false).fetch();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryColor,
        onPressed: () {
          Navigator.push(
            context,
            CupertinoModalPopupRoute(
              builder: (context) => NewTodoScreen(),
            ),
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
            child: Consumer<TodoProvider>(
              builder: (context, value, child) {
                if (value.todos.isEmpty) {
                  if (value.isLoading) {
                    return SizedBox.shrink();
                  }

                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'assets/empty.svg',
                        width: 250,
                      ),
                      SizedBox(height: 30),
                      Text(
                        "No Todo!",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "There is no todo for now\nyou can add one by tapping plus",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  );
                }

                return ListView.separated(
                  padding: EdgeInsets.only(
                    top: 160,
                    left: 24,
                    right: 24,
                  ),
                  itemCount: value.todos.keys.length,
                  separatorBuilder: (context, index) => SizedBox(height: 10),
                  itemBuilder: (context, index) {
                    String key = value.todos.keys.elementAt(index);
                    TodoModel? model = value.todos[key];

                    if (model == null) {
                      return SizedBox.shrink();
                    }

                    return Dismissible(
                      direction: DismissDirection.endToStart,
                      confirmDismiss: (direction) async {
                        context.read<TodoProvider>().removeToDo(key);
                        return true;
                      },
                      key: Key(key),
                      child: Container(
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
                            IconButton(
                              onPressed: () {
                                context.read<TodoProvider>().toggleTodo(
                                      id: key,
                                      value: !model.checked,
                                    );
                              },
                              icon: model.checked
                                  ? Icon(
                                      IconlyLight.tickSquare,
                                      size: 24,
                                    )
                                  : Container(
                                      height: 19,
                                      width: 19,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                          width: 1.2,
                                        ),
                                      ),
                                    ),
                            ),
                            SizedBox(width: 18),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    model.name,
                                  ),
                                  Text(
                                    DateFormat.jm().format(model.createdAt),
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black.withValues(alpha: .6),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // IconButton(
                            //   onPressed: () {},
                            //   icon: Icon(
                            //     Icons.remove,
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    );
                  },
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
                  child: Row(
                    children: [
                      Column(
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
