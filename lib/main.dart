import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts/cubits/auth_cubit/auth_cubit.dart';
import 'package:posts/helpers/routes.dart';
import 'package:posts/helpers/supabase.dart';
import 'package:posts/services/auth_services.dart';
import 'package:posts/view/home_view.dart';
import 'package:posts/view/onboaring_view.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(create: (context) => AuthCubit(AuthRepoImpl())),
      ],
      child: MaterialApp(
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
            RoutesHelper.homePage: (context) => const HomeView(),
            RoutesHelper.signInPage: (context) => const SignIn(),
            RoutesHelper.signUpPage: (context) => const SignUp(),
          }),
    );
  }
}
