import 'package:flutter/material.dart';
import 'package:posts/data.dart';
import 'package:posts/helpers/colors.dart';
import 'package:posts/helpers/sizes.dart';
import 'package:posts/helpers/styles.dart';
import 'package:posts/widget/post_widget.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({super.key});

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Feed',
          style: StylesHelper().appBarTextStyle(ColorsHelper.tiles),
        ),
        backgroundColor: ColorsHelper.primary,
        foregroundColor: ColorsHelper.background,
      ),
      body: Container(
        color: ColorsHelper.background,
        child: ListView.separated(
          itemCount: posts.length,
          itemBuilder: (context, index) {
            return PostWidget(post: posts[index]);
          },
          separatorBuilder: (context, index) {
            return const SizedBox(height: Sizes.s1);
          },
        ),
      ),
    );
  }
}
