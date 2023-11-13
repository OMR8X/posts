import 'package:flutter/material.dart';
import 'package:posts/helpers/colors.dart';
import 'package:posts/view/HomePage.dart';
import 'package:posts/view/signin.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        textTheme: const TextTheme(),
      ),
      home: const HomePage(),
      routes: {
        "SignIn": (context) => const SignIn(),
      },
    );
  }
}

//------------------------------------------------------------------------------
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsHelper.tiles,
      body: Center(
        child: CheckBoxWidget(
          value: value,
          onTap: (val) {
            setState(() {
              value = !value;
            });
          },
        ),
      ),
    );
  }
}

class CheckBoxWidget extends StatefulWidget {
  const CheckBoxWidget({super.key, required this.value, required this.onTap});
  final bool value;
  final Function(bool) onTap;
  @override
  State<CheckBoxWidget> createState() => _CheckBoxWidgetState();
}

class _CheckBoxWidgetState extends State<CheckBoxWidget> {
  bool insideValue = false;
  @override
  void initState() {
    insideValue = widget.value;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant CheckBoxWidget oldWidget) {
    insideValue = widget.value;
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: insideValue,
      onChanged: (b) {
        widget.onTap(b!);
      },
    );
  }
}
