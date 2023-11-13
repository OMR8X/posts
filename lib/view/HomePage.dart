import 'package:flutter/material.dart';
import 'package:posts/helpers/colors.dart';
import 'package:posts/helpers/names.dart';
import 'package:posts/widget/sign_in_up_Button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: ColorsHelper.background,
          ),
          Container(
            height: 50 + size.height / 2,
            decoration: BoxDecoration(
              color: ColorsHelper.primary,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(50.0),
                topRight: Radius.circular(50.0),
                bottomLeft: Radius.circular(100.0),
                bottomRight: Radius.circular(100.0),
              ),
            ),
          ),
          Positioned(
            top: 60.0,
            left: 10.0,
            child: Text(
              'Welcome!',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.w700,
                color: ColorsHelper.tiles,
              ),
            ),
          ),
          Column(
            children: [
              const Spacer(),
              Center(
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 40.0,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 30.0,
                  ),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: ColorsHelper.tiles,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(40.0),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        NamesHelper.signInUpPageTitle,
                        style: TextStyle(
                          color: ColorsHelper.primary,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SingInUpButton(
                        color: ColorsHelper.primary,
                        onPressed: () {
                          // sign up code
                        },
                        child: Text(
                          'Sign up',
                          style: TextStyle(color: ColorsHelper.tiles),
                        ),
                      ),
                      SingInUpButton(
                        color: ColorsHelper.background,
                        onPressed: () {
                          Navigator.of(context).pushNamed("SignIn");
                        },
                        child: const Text(
                          'Sign in',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
        ],
      ),
    );
  }
}
