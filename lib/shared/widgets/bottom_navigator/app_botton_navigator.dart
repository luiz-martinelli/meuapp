import 'package:flutter/cupertino.dart';
import 'package:meuapp/shared/theme/app_theme.dart';
import 'package:flutter/material.dart';

class AppBottomNavigator extends StatelessWidget {
  const AppBottomNavigator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 26, left: 26, bottom: 14),
      child: Container(
        height: 76,
        decoration: BoxDecoration(
          color: AppTheme.Colors.textEnabled,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 40,
              height: 40,
              child: Icon(
                Icons.home,
                color: AppTheme.Colors.textEnabled,
              ),
              decoration: BoxDecoration(
                color: AppTheme.Colors.primary,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            Container(
              width: 40,
              height: 40,
              child: Icon(
                Icons.add,
                color: AppTheme.Colors.iconInactive,
              ),
              decoration: BoxDecoration(
                color: AppTheme.Colors.background,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            Container(
              width: 40,
              height: 40,
              child: Icon(
                Icons.settings,
                color: AppTheme.Colors.iconInactive,
              ),
              decoration: BoxDecoration(
                color: AppTheme.Colors.background,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
