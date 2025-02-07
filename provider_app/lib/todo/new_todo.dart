import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/todo/todo_provider.dart';
import 'package:provider_app/utils.dart';

class NewTodoScreen extends StatefulWidget {
  const NewTodoScreen({super.key});

  @override
  State<NewTodoScreen> createState() => _NewTodoScreenState();
}

class _NewTodoScreenState extends State<NewTodoScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(40),
      ),
      child: FractionallySizedBox(
        heightFactor: .8,
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                "assets/bg.png",
                fit: BoxFit.cover,
              ),
            ),
            Scaffold(
              backgroundColor: Colors.transparent,
              body: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    SizedBox(height: 30),
                    // IconButton(
                    //   onPressed: () {},
                    //   icon: Row(
                    //     children: [
                    //       IconButton(
                    //         onPressed: () {
                    //           Navigator.pop(context);
                    //         },
                    //         icon: Icon(Icons.close),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    SizedBox(height: 30),
                    TextFormField(
                      controller: _controller,
                      autofocus: true,
                      decoration: InputDecoration(
                        hintText: "Task Name",
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 24,
                          horizontal: 18,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.white.withValues(alpha: .6),
                      ),
                    ),
                    Spacer(),
                    FractionallySizedBox(
                      widthFactor: 1,
                      child: FilledButton(
                        style: FilledButton.styleFrom(
                          backgroundColor: AppColors.primaryColor,
                          padding: EdgeInsets.symmetric(
                            vertical: 24,
                          ),
                        ),
                        onPressed: () {
                          context
                              .read<TodoProvider>()
                              .addTodo(_controller.text);

                          Navigator.pop(context);
                        },
                        child: Text(
                          "Add",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.paddingOf(context).bottom + 30),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
