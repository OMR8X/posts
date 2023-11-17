import 'package:flutter/material.dart';
import 'package:posts/helpers/routes.dart';
<<<<<<< HEAD
import 'package:posts/helpers/supabase.dart';
import 'package:posts/view/onboarding_view.dart';
=======
import 'package:posts/view/feed_page.dart';
import 'package:posts/view/home_page.dart';
>>>>>>> c3e372c8b9cbd5675e1d9ed05c13d94eec069c81
import 'package:posts/view/signin.dart';
import 'package:posts/view/signup.dart';
import 'package:posts/view/splash_view.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  await Supabase.initialize(
    url: SupabaseHleaper.url,
    anonKey: SupabaseHleaper.anonKey,
    authFlowType: AuthFlowType.pkce,
  );
  runApp(const MyApp());
}

final supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
<<<<<<< HEAD
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          textTheme: const TextTheme(),
        ),
        home: const SplashView(),
        routes: {
          RoutesHelper.onboarding: (context) => const OnboardingView(),
          RoutesHelper.signInPage: (context) => const SignIn(),
          RoutesHelper.signUpPage: (context) => const SignUp(),
        });
=======
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
>>>>>>> c3e372c8b9cbd5675e1d9ed05c13d94eec069c81
  }
}
