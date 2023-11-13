import 'package:flutter/material.dart';
import 'package:posts/helpers/colors.dart';
import 'package:posts/helpers/spacing.dart';
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
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: ColorsHelper.primary,
        foregroundColor: Colors.white,
        title: Text(
          title,
          style: StylesHelper().appBarTextStyle(
            ColorsHelper.tiles,
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
            color: ColorsHelper.background,
          ),
          Container(
            height: size.height * 0.5,
            decoration: BoxDecoration(
              color: ColorsHelper.primary,
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(100.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
