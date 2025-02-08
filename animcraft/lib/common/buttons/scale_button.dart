import 'dart:async';

import 'package:flutter/widgets.dart';

class ScaleButton extends StatefulWidget {
  const ScaleButton(
      {super.key,
      required this.onTap,
      required this.child,
      this.scale,
      this.onLongPress});

  @override
  State<ScaleButton> createState() => _ScaleButtonState();
  final FutureOr<void> Function()? onTap;
  final VoidCallback? onLongPress;
  final Widget child;
  final double? scale;
}

class _ScaleButtonState extends State<ScaleButton> {
  bool isPressed = false;
  bool loading = false;

  func() async {
    loading = true;
    setState(() {});

    try {
      await widget.onTap?.call();
    } catch (e) {
      //
    }

    loading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: isPressed ? (widget.scale ?? .97) : 1,
      duration: const Duration(milliseconds: 100),
      child: GestureDetector(
        onTap: widget.onTap == null || loading
            ? null
            : () {
                if (widget.onTap != null) {
                  setState(() {
                    isPressed = true;
                  });
                  Future.delayed(const Duration(milliseconds: 50))
                      .then((value) {
                    setState(() {
                      isPressed = false;
                    });
                    func();
                  });
                }
              },
        onTapDown: (_) {
          if (widget.onTap != null && loading != true) {
            setState(() {
              isPressed = true;
            });
          }
        },
        onLongPress: widget.onLongPress == null || loading
            ? null
            : () {
                widget.onLongPress!();
              },
        onTapUp: (_) {
          if (widget.onTap != null && loading != true) {
            setState(() {
              isPressed = false;
            });
          }
        },
        onTapCancel: () {
          if (widget.onTap != null && loading != true) {
            setState(() {
              isPressed = false;
            });
          }
        },
        child: AnimatedOpacity(
          opacity: loading ? .5 : 1,
          duration: const Duration(milliseconds: 300),
          child: widget.child,
        ),
      ),
    );
  }
}