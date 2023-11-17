import 'package:flutter/material.dart';
import 'package:posts/classes/post.dart';
import 'package:posts/helpers/colors.dart';
import 'package:posts/helpers/sizes.dart';
import 'package:posts/helpers/spacing.dart';
import 'package:posts/helpers/styles.dart';
import 'package:intl/intl.dart';
import 'package:posts/view/comments_page.dart';

class PostWidget extends StatefulWidget {
  final Post post;
  const PostWidget({super.key, required this.post});

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  bool like = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding:
          const EdgeInsets.symmetric(vertical: SpaceHelper.feedPagePadding),
      color: ColorsHelper.tiles,
      child: Column(
        children: [
          ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(50.0),
              child: Image.asset(
                widget.post.user.userImage,
                width: 50.0,
                height: 50.0,
                fit: BoxFit.cover,
              ),
            ),
            title: Text(
              widget.post.user.username,
              style: StylesHelper().listTileTitleTextStyle(),
            ),
            subtitle: Text(
              DateFormat('kk:mm a').format(widget.post.time),
              style: StylesHelper().listTileSubtitleTextStyle(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: SpaceHelper.feedPagePadding * 2,
              vertical: SpaceHelper.feedPagePadding,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                widget.post.description.isNotEmpty
                    ? Text(
                        widget.post.description,
                        style: StylesHelper()
                            .listTileSubtitleTextStyle(Colors.black),
                      )
                    : const SizedBox(),
                SizedBox(
                  height: widget.post.description.isNotEmpty ? Sizes.s1 : 0.0,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: widget.post.image.isNotEmpty
                      ? Image.asset(
                          widget.post.image,
                          fit: BoxFit.cover,
                          width: size.width - SpaceHelper.feedPagePadding * 4,
                        )
                      : null,
                ),
                const SizedBox(height: Sizes.s1),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          // add like to post
                          like = !like;
                          like ? ++widget.post.likes : --widget.post.likes;
                        });
                      },
                      child: Icon(
                        like ? Icons.favorite : Icons.favorite_border,
                        color: like ? Colors.red : Colors.black,
                        size: 25.0,
                      ),
                    ),
                    const SizedBox(width: Sizes.s1 * 2),
                    Text(
                      widget.post.likes.toString(),
                      style: StylesHelper()
                          .listTileSubtitleTextStyle(Colors.black),
                    ),
                    const SizedBox(width: Sizes.s1 * 2),
                    InkWell(
                      onTap: () {
                        // open Comment Page
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => CommentsPage(
                              comments: widget.post.comment,
                            ),
                          ),
                        );
                      },
                      child: const Icon(
                        Icons.chat_bubble_outline,
                        color: Colors.black,
                        size: 25.0,
                      ),
                    ),
                    const SizedBox(width: Sizes.s1 * 2),
                    Text(
                      widget.post.comment.length.toString(),
                      style: StylesHelper()
                          .listTileSubtitleTextStyle(Colors.black),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
