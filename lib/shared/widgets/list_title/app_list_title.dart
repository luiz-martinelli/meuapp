import 'package:flutter/material.dart';
import 'package:meuapp/shared/theme/app_theme.dart';

class AppListTitle extends StatelessWidget {
  const AppListTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.Colors.textEnabled,
          borderRadius: BorderRadius.circular(12),
        ),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: AppTheme.Colors.background,
            radius: 30,
            child: Text(
              "12/12",
              style: AppTheme.textStyles.label,
            ),
          ),
          title: Text(
            "Produto",
            style: AppTheme.textStyles.titleListTile,
          ),
          subtitle: Text(
            "Preço",
            style: AppTheme.textStyles.subtitleListTile,
          ),
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
      ),
    );
  }
}
