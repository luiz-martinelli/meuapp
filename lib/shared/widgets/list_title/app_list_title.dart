import 'package:flutter/material.dart';
import 'package:meuapp/shared/theme/app_theme.dart';

class AppListTitle extends StatelessWidget {
  const AppListTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.Colors.textEnabled,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: AppTheme.Colors.background,
          radius: 30,
          child: const Text(
            "12/12",
            style: TextStyle(color: Colors.black),
          ),
        ),
        title: const Text("Produto"),
        subtitle: const Text("Preço"),
        trailing: PopupMenuButton(
          itemBuilder: (context) => [
            const PopupMenuItem(
              child: Text("Editar"),
            ),
            const PopupMenuItem(
              child: Text("Excluir"),
            )
          ],
        ),
      ),
    );
  }
}
