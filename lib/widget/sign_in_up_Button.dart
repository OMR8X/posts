import 'package:flutter/material.dart';

class SingInUpButton extends StatelessWidget {
  final Color color;
  final void Function() onPressed;
  final Widget child;
  const SingInUpButton({
    super.key,
    required this.color,
    required this.onPressed,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: MaterialButton(
        elevation: 0.0,
        minWidth: double.infinity,
        height: 50.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        color: color,
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
