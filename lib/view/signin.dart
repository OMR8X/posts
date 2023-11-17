import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts/cubits/auth_cubit/auth_cubit.dart';
import 'package:posts/helpers/colors.dart';
import 'package:posts/helpers/names.dart';
import 'package:posts/helpers/routes.dart';
import 'package:posts/helpers/sizes.dart';
import 'package:posts/helpers/spacing.dart';
import 'package:posts/widget/background.dart';
import 'package:posts/widget/button_widget.dart';
import 'package:posts/widget/text_form_field_signinup.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackGround(title: NamesHelper.signInPageTitle),
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
                  width: SpaceHelper.getWidthOfSignCenterWidget(context),
                  decoration: BoxDecoration(
                    color: ColorsHelper.tiles,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(40.0),
                    ),
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextFieldSignInUp(
                          controller: _emailController,
                          text: "Email",
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Empty Text Field";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: Sizes.s1),
                        TextFieldSignInUp(
                          controller: _passwordController,
                          text: "Password",
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Empty Text Field";
                            }
                            return null;
                          },
                          isPassword: true,
                        ),
                        const SizedBox(height: Sizes.s1),
                        ButtonWidget(
                          color: ColorsHelper.primary,
                          onPressed: () {
                            BlocProvider.of<AuthCubit>(context).registerUser(
                              email: "testuser1@gmail.com",
                              password: "123123123",
                            );
                            if (_formKey.currentState!.validate()) {
                              // sign in code
                              // Navigator to Feed Page
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  RoutesHelper.feedPage, (route) => false);
                            }
                          },
                          text: 'Sign in',
                          textColor: ColorsHelper.tiles,
                        ),
                      ],
                    ),
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
