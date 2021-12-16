import 'package:flutter/material.dart';
import 'package:meuapp/shared/theme/app_theme.dart';

class CardProduct extends StatelessWidget {
  const CardProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: 230,
        decoration: BoxDecoration(
          color: AppTheme.Colors.textEnabled,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundColor: AppTheme.Colors.background,
                radius: 30,
                child: const Icon(Icons.linked_camera_sharp),
              ),
              title: const Text("Produto"),
              subtitle: const Text("Preço"),
            ),
            const Text.rich(
              TextSpan(text: "Agora\n", children: [
                TextSpan(text: "R\$ 67,50"),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
