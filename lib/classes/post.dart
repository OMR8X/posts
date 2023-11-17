import 'package:posts/classes/comments.dart';
import 'package:posts/classes/user.dart';

class Post {
  final User user;
  //
  final String description;
  final String image;
  final DateTime time;
  //
  int likes;
  List<Comment> comment;

  Post({
    required this.time,
    required this.user,
    required this.description,
    required this.image,
    required this.likes,
    required this.comment,
  });
}
