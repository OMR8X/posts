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
    return Scaffold(
      appBar: AppBar(
        leading: title == "Welcome!"
            ? null
            : IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
              ),
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
