import 'package:posts/classes/user.dart';

class Comment {
  final User user;
  final String comment;
  final DateTime time;

  Comment({
    required this.time,
    required this.user,
    required this.comment,
  });
}
