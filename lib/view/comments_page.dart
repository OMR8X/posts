import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:posts/classes/comments.dart';
import 'package:posts/classes/user.dart';
import 'package:posts/helpers/colors.dart';
import 'package:posts/helpers/sizes.dart';
import 'package:posts/helpers/spacing.dart';
import 'package:posts/helpers/styles.dart';

class CommentsPage extends StatefulWidget {
  final List<Comment> comments;
  const CommentsPage({super.key, required this.comments});

  @override
  State<CommentsPage> createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
  late TextEditingController _commentController;
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    _commentController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        title: Text(
          'Comments',
          style: StylesHelper().appBarTextStyle(Colors.black),
        ),
        backgroundColor: ColorsHelper.tiles,
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Container(
          color: ColorsHelper.background,
          child: Stack(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 66.0),
                child: ListView.separated(
                  reverse: true,
                  controller: _scrollController,
                  itemCount: widget.comments.length,
                  itemBuilder: (context, index) {
                    return Container(
                      color: ColorsHelper.tiles,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(50.0),
                              child: Image.asset(
                                widget.comments[index].user.userImage,
                                width: 50.0,
                                height: 50.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                            title: Text(
                              widget.comments[index].user.username,
                              style: StylesHelper().listTileTitleTextStyle(),
                            ),
                            subtitle: Text(
                              DateFormat('kk:mm a')
                                  .format(widget.comments[index].time),
                              style: StylesHelper().listTileSubtitleTextStyle(),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: SpaceHelper.feedPagePadding * 2,
                              vertical: SpaceHelper.feedPagePadding,
                            ),
                            child: Text(
                              widget.comments[index].comment,
                              style: StylesHelper()
                                  .listTileSubtitleTextStyle(Colors.black),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: Sizes.s1);
                  },
                ),
              ),
              Positioned(
                bottom: 0.0,
                child: Container(
                  color: ColorsHelper.tiles,
                  width: size.width,
                  child: TextFormField(
                    controller: _commentController,
                    onTapOutside: (e) {
                      FocusScope.of(context).unfocus();
                    },
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.zero,
                        borderSide: BorderSide.none,
                      ),
                      hintText: 'Comment',
                      hintStyle: const TextStyle(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFFB2ADAD),
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          // add comment
                          if (_commentController.text.isNotEmpty) {
                            widget.comments.insert(
                              0,
                              Comment(
                                // any data
                                //           ___
                                //          (`_`)   ___
                                //          /| |\  |___|
                                //         / | | \  /   SELECT video
                                //         \ | |  \/    FROM PGitHup
                                //          \| |        WHERE vidoe.viewer > 2M;
                                //      .====\\|
                                //    ..    // \\
                                //   ..    //   \\
                                //  ..  __//     \\__
                                //..`..|__|       |__|
                                time: DateTime.now(),
                                user: User(
                                  time: DateTime.now(),
                                  userImage: 'assets/download.jpg',
                                  username: 'Hello MF',
                                ),
                                comment: _commentController.text,
                              ),
                            );
                            _commentController.text = "";
                            setState(() {});
                            _scrollController.animateTo(
                              0.0,
                              duration: const Duration(microseconds: 300),
                              curve: Curves.easeIn,
                            );
                          }
                        },
                        icon: Text(
                          'Post  ',
                          style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w800,
                            color: ColorsHelper.primary,
                          ),
                        ),
                      ),
                    ),
                    cursorColor: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
