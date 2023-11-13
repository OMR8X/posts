import 'package:flutter/material.dart';
import 'package:posts/helpers/colors.dart';
import 'package:posts/helpers/names.dart';
import 'package:posts/helpers/routes.dart';
import 'package:posts/helpers/spacing.dart';
import 'package:posts/helpers/styles.dart';
import 'package:posts/widget/background.dart';
import 'package:posts/widget/sign_in_up_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackGround(title: "Welcome!"),
          Column(
            children: [
              const Spacer(),
              Center(
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: SpaceHelper.padding,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: SpaceHelper.padding,
                    vertical: SpaceHelper.padding * (3 / 2),
                  ),
                  width: SpaceHelper.getWidthOfHomePageCenterWidget(context),
                  decoration: BoxDecoration(
                    color: ColorsHelper.tiles,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(40.0),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Text(
                          NamesHelper.homePageText,
                          style: StylesHelper()
                              .appBarTextStyle(ColorsHelper.primary),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SingInUpButton(
                        color: ColorsHelper.primary,
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(RoutesHelper.signUpPage);
                        },
                        text: 'Sign up',
                        textColor: ColorsHelper.tiles,
                      ),
                      SingInUpButton(
                        color: ColorsHelper.background,
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(RoutesHelper.signInPage);
                        },
                        text: 'Sign in',
                        textColor: Colors.black,
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
