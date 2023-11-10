import 'package:posts/classes/comments.dart';
import 'package:posts/classes/user.dart';

class Post {
  final User user;
  //
  final String description;
  final String image;
  //
  final int likes;
  final List<Comment> comment;

  Post({
    required this.user,
    required this.description,
    required this.image,
    required this.likes,
    required this.comment,
  });
}
