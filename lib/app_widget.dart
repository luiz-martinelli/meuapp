import 'package:flutter/material.dart';
import 'package:meuapp/modules/feed/feed_page.dart';
import 'package:meuapp/modules/login/login_page.dart';
import 'package:meuapp/modules/login/pages/create_account/create_account_page.dart';
import 'package:meuapp/modules/login/pages/home/home_page.dart';
import 'package:meuapp/modules/profile/profile_page.dart';
import 'package:meuapp/modules/splash/splash_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter race",
      theme: ThemeData(primarySwatch: Colors.green),
      initialRoute: "/splash",
      routes: {
        "/splash": (context) => const Splashpage(),
        "/login": (context) => const LoginPage(),
        "/login/create-account": (context) => const CreateAccountPage(),
        "/home": (context) => const HomePage(
              pages: [
                FeedPage(),
                ProfilePage(),
              ],
            ),
        //user: ModalRoute.of(context)!.settings.arguments as UserModel
      },
    );
  }
}
