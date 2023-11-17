import 'package:flutter/material.dart';
import 'package:posts/helpers/colors.dart';
import 'package:posts/helpers/names.dart';
import 'package:posts/helpers/routes.dart';
import 'package:posts/helpers/sizes.dart';
import 'package:posts/helpers/spacing.dart';
import 'package:posts/helpers/styles.dart';
import 'package:posts/widget/background.dart';
import 'package:posts/widget/button_widget.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
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
                      ButtonWidget(
                        color: ColorsHelper.primary,
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(RoutesHelper.signUpPage);
                        },
                        text: 'Sign up',
                        textColor: ColorsHelper.tiles,
                      ),
                      const SizedBox(height: Sizes.s1),
                      ButtonWidget(
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
