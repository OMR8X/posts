import 'package:flutter/material.dart';
import 'package:posts/helpers/colors.dart';
import 'package:posts/helpers/names.dart';
import 'package:posts/helpers/sizes.dart';
import 'package:posts/helpers/spacing.dart';
import 'package:posts/widget/background.dart';
import 'package:posts/widget/button_widget.dart';
import 'package:posts/widget/text_form_field_signinup.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late TextEditingController _emailController;
  late TextEditingController _nameController;
  late TextEditingController _passwordController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    _emailController = TextEditingController();
    _nameController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackGround(title: NamesHelper.signUpPageTitle),
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
                    child: ListView(
                      padding: const EdgeInsets.all(0.0),
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      children: [
                        TextFieldSignInUp(
                          controller: _nameController,
                          text: "Name",
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Empty Text Field";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: Sizes.s1),
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
                          text: "Passowrd",
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Empty Text Field";
                            }
                            return null;
                          },
                          isPassword: true,
                        ),
                        const SizedBox(height: Sizes.s2),
                        ButtonWidget(
                          color: ColorsHelper.primary,
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              // sign up code
                              // Navigator to Feed Page
                            }
                          },
                          text: 'Sign up',
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
