import 'package:flutter/material.dart';

class KFloatingActionButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget? child;

  const KFloatingActionButton({
    Key? key,
    required this.onPressed,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(),
        Positioned(
          bottom: 60,
          right: 0,
          child: FloatingActionButton.small(
            onPressed: onPressed,
            child: child ??
                const Icon(
                  Icons.add,
                ),
          ),
        ),
      ],
    );
  }
}
