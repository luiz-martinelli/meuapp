import 'package:flutter/material.dart';
import 'package:meuapp/shared/theme/app_theme.dart';

class Splashpage extends StatelessWidget {
  const Splashpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3)).then((value) {
      Navigator.pushNamed(context, "/login");
    });
    return Scaffold(
      backgroundColor: AppTheme.Colors.background,
      body: Center(
        child: Image.asset("assets/images/logo.png"),
      ),
    );
  }
}
