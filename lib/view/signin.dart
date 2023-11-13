import 'package:flutter/material.dart';
import 'package:posts/helpers/colors.dart';
import 'package:posts/widget/sign_in_up_Button.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  late TextEditingController _emailController;
  @override
  void initState() {
    _emailController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

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
              'Sign In!',
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
                    horizontal: 20.0,
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
                      TextFieldSignInUp(emailController: _emailController),
                      TextFieldSignInUp(emailController: _emailController),
                      SingInUpButton(
                        color: ColorsHelper.primary,
                        onPressed: () {
                          // sign in code
                        },
                        child: Text(
                          'Sign in',
                          style: TextStyle(color: ColorsHelper.tiles),
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

class TextFieldSignInUp extends StatelessWidget {
  const TextFieldSignInUp({
    super.key,
    required TextEditingController emailController,
  }) : _emailController = emailController;

  final TextEditingController _emailController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _emailController,
      validator: (val) {
        if (val!.isEmpty) {
          return "Empty Text Form Field";
        }
        return null;
      },
      onTapOutside: (e) {
        FocusScope.of(context).unfocus();
      },
      cursorColor: Colors.black,
      decoration: InputDecoration(
        hintText: "Email",
        hintStyle: TextStyle(
          fontSize: 15.0,
          color: Colors.grey.withOpacity(0.8),
        ),
        enabled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide(
            color: Colors.grey.withOpacity(0.5),
            width: 1.0,
            style: BorderStyle.solid,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide(
            color: Colors.grey.withOpacity(0.5),
            width: 1.0,
            style: BorderStyle.solid,
          ),
        ),
      ),
    );
  }
}
