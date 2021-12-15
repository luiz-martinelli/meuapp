import 'package:flutter/material.dart';
import 'package:meuapp/shared/models/user_model.dart';

class HomePage extends StatelessWidget {
  final UserModel user;
  const HomePage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Home page"),
      ),
    );
  }
}
