import 'package:flutter/material.dart';
import 'package:posts/helpers/routes.dart';
import 'package:posts/main.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    redirect(context, mounted);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Future<void> redirect(BuildContext context, bool mounted) async {
    await Future.delayed(const Duration(seconds: 1));
    if (!mounted) {
      return;
    }
    final session = supabase.auth.currentSession;
    if (session == null) {
      Navigator.of(context).pushReplacementNamed(RoutesHelper.onboarding);
    } else {
      Navigator.of(context).pushReplacementNamed(RoutesHelper.homePage);
    }
  }
}
