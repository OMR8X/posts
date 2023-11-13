import 'package:flutter/material.dart';
import 'package:posts/helpers/colors.dart';
import 'package:posts/helpers/styles.dart';

class BackGround extends StatelessWidget {
  final String title;
  const BackGround({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          color: ColorsHelper.background,
        ),
        Container(
          height: size.height * 0.6,
          decoration: BoxDecoration(
            color: ColorsHelper.primary,
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(50.0),
              bottom: Radius.circular(100.0),
            ),
          ),
        ),
        // AppBar
        Positioned(
          top: 60.0,
          left: 10.0,
          child: Text(
            title,
            style: StylesHelper().appBarTextStyle(ColorsHelper.tiles),
          ),
        ),
      ],
    );
  }
}
