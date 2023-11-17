import 'package:flutter/material.dart';
import 'package:posts/helpers/routes.dart';
import 'package:posts/view/feed_page.dart';
import 'package:posts/view/home_page.dart';
import 'package:posts/view/signin.dart';
import 'package:posts/view/signup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        textTheme: const TextTheme(),
      ),
      home: const HomePage(),
      routes: {
        RoutesHelper.signInPage: (context) => const SignIn(),
        RoutesHelper.signUpPage: (context) => const SignUp(),
        RoutesHelper.feedPage: (context) => const FeedPage(),
      },
    );
  }
}
