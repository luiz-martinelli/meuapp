import 'package:flutter/material.dart';
import 'package:meuapp/shared/theme/app_theme.dart';
import 'package:meuapp/shared/widgets/bottom_navigator/app_botton_navigator.dart';

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
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: AppTheme.Colors.textEnabled,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    leading: const CircleAvatar(
                      radius: 30,
                      child: Text("12/12"),
                    ),
                    title: const Text("Produto"),
                    subtitle: const Text("Preço"),
                    trailing: PopupMenuButton(
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          child: Text("Editar"),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
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
        ));
  }
}
