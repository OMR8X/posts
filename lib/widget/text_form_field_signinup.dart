import 'package:flutter/material.dart';
import 'package:posts/helpers/spacing.dart';
import 'package:posts/helpers/styles.dart';

class TextFieldSignInUp extends StatefulWidget {
  const TextFieldSignInUp({
    super.key,
    this.validator,
    required this.controller,
    required this.text,
    this.isPassword = false,
  });
  final bool isPassword;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final String text;

  @override
  State<TextFieldSignInUp> createState() => _TextFieldSignInUpState();
}

class _TextFieldSignInUpState extends State<TextFieldSignInUp> {
  late bool show;
  @override
  void initState() {
    show = widget.isPassword;
    super.initState();
  }

  final InputBorder _inputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(15.0),
    borderSide: const BorderSide(
      color: Color(0xFFDEDEDE),
      width: 1.0,
      style: BorderStyle.solid,
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: SpaceHelper.padding / 2),
      child: TextFormField(
        obscureText: show,
        controller: widget.controller,
        validator: widget.validator,
        onTapOutside: (e) {
          FocusScope.of(context).unfocus();
        },
        cursorColor: Colors.black,
        decoration: InputDecoration(
          suffixIcon: widget.isPassword
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      show = !(show);
                    });
                  },
                  icon: Icon(show ? Icons.visibility : Icons.visibility_off),
                )
              : null,
          labelText: widget.text,
          labelStyle: StylesHelper().textFormFieldTextStyle(),
          enabled: true,
          enabledBorder: _inputBorder,
          focusedBorder: _inputBorder,
          border: _inputBorder,
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: const BorderSide(
              color: Colors.red,
              width: 1.0,
              style: BorderStyle.solid,
            ),
          ),
        ),
      ),
    );
  }
}
