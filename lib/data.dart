import 'package:posts/classes/comments.dart';
import 'package:posts/classes/post.dart';
import 'package:posts/classes/user.dart';

List<User> users = [
  User(
    username: "Marry Piterson",
    userImage: 'assets/download.jpg',
    time: DateTime(2023, 1, 1, 1, 22),
  ),
  User(
    username: "69 Boy",
    userImage: 'assets/download.jpg',
    time: DateTime(2023, 1, 1, 1, 25),
  ),
  User(
    username: "Mark Simpson",
    userImage: 'assets/download.jpg',
    time: DateTime(2023, 1, 1, 2, 55),
  ),
  User(
    username: "Nine Eleven Tac",
    userImage: 'assets/download.jpg',
    time: DateTime(2023, 1, 1, 3, 14),
  ),
];

List<List<Comment>> comments = [
  [
    Comment(
        user: users[0],
        comment:
            'Lorem ipsum dolor sit amet consectetur. Scelerisque cum consequat eleifend purus ipsum lectus commodo eget. Ornare facilisis lectus tristique mi. Nisl urna rhoncus pulvinar nec dui mi etiam eget. Amet mauris at quisque sapien.',
        time: DateTime.now()),
    Comment(user: users[1], comment: 'comment 2', time: DateTime.now()),
    Comment(user: users[2], comment: 'comment 3', time: DateTime.now()),
    Comment(
        user: users[3],
        comment:
            'Lorem ipsum dolor sit amet consectetur. Scelerisque cum consequat eleifend purus ipsum lectus commodo eget. Ornare facilisis lectus tristique mi. Nisl urna rhoncus pulvinar nec dui mi etiam eget. Amet mauris at quisque sapien.',
        time: DateTime.now()),
    Comment(user: users[0], comment: 'comment 5', time: DateTime.now()),
  ],
  [
    Comment(user: users[0], comment: 'comment 6', time: DateTime.now()),
    Comment(user: users[1], comment: 'comment 7', time: DateTime.now()),
    Comment(user: users[2], comment: 'comment 8', time: DateTime.now()),
    Comment(user: users[3], comment: 'comment 9', time: DateTime.now()),
    Comment(user: users[0], comment: 'comment 10', time: DateTime.now()),
  ],
  [
    Comment(user: users[0], comment: 'comment 11', time: DateTime.now()),
    Comment(user: users[1], comment: 'comment 12', time: DateTime.now()),
    Comment(user: users[2], comment: 'comment 13', time: DateTime.now()),
    Comment(user: users[3], comment: 'comment 14', time: DateTime.now()),
    Comment(user: users[0], comment: 'comment 15', time: DateTime.now()),
  ],
];

List<Post> posts = [
  Post(
    user: users[0],
    description:
        "Lorem ipsum dolor sit amet consectetur. Scelerisque cum consequat eleifend purus ipsum lectus commodo eget. Ornare facilisis lectus tristique mi. Nisl urna rhoncus pulvinar nec dui mi etiam eget. Amet mauris at quisque sapien.",
    image: 'assets/download.jpg',
    likes: 5,
    comment: comments[0],
    time: DateTime.now(),
  ),
  Post(
    user: users[1],
    description: "krvnkjt g rkj  krtkkt",
    image: '',
    likes: 125,
    comment: comments[1],
    time: DateTime.now(),
  ),
  Post(
    user: users[2],
    description: "",
    image: 'assets/download.jpg',
    likes: 821,
    comment: comments[2],
    time: DateTime.now(),
  ),
];
