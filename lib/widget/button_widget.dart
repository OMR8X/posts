import 'package:flutter/material.dart';
import 'package:posts/helpers/spacing.dart';
import 'package:posts/helpers/styles.dart';

class ButtonWidget extends StatelessWidget {
  final Color color;
  final void Function() onPressed;
  final String text;
  final Color textColor;
  const ButtonWidget({
    super.key,
    required this.color,
    required this.onPressed,
    required this.text,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(bottom: SpaceHelper.padding / 2), //top: 15.0),
      child: MaterialButton(
        elevation: 0.0,
        minWidth: double.infinity,
        height: 50.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        color: color,
        onPressed: onPressed,
        child: Text(
          text,
          style: StylesHelper().buttonTextStyle(textColor),
        ),
      ),
    );
  }
}
