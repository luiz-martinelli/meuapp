import 'package:flutter/material.dart';
import 'package:meuapp/shared/theme/app_theme.dart';
import 'package:meuapp/shared/widgets/bottom_navigator/app_botton_navigator.dart';
import 'package:meuapp/shared/widgets/card_product/card_product.dart';
import 'package:meuapp/shared/widgets/list_title/app_list_title.dart';

class HomePage extends StatefulWidget {
  //final UserModel user;
  const HomePage({
    Key? key,
    /*required this.user*/
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentIndex = 0;
  void changeIndex(int index) {
    currentIndex = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.Colors.background,
      body: Stack(
        children: [
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 126,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => const CardProduct(),
              ),
            ),
            const AppListTitle(),
            const AppListTitle(),
            const AppListTitle(),
          ]),
          Positioned(
            bottom: 14,
            left: 26,
            right: 26,
            child: AppBottomNavigator(
              currentIndex: currentIndex,
              onChanged: changeIndex,
            ),
          )
        ],
      ),
    );
  }
}
