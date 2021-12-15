import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:meuapp/shared/theme/app_theme.dart';

class AppBottomNavigator extends StatelessWidget {
  final int currentIndex;
  const AppBottomNavigator({
    Key? key,
    required this.currentIndex,
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
                color: currentIndex == 0
                    ? AppTheme.Colors.textEnabled
                    : AppTheme.Colors.iconInactive,
              ),
              decoration: BoxDecoration(
                color: currentIndex == 0
                    ? AppTheme.Colors.primary
                    : AppTheme.Colors.background,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            Container(
              width: 40,
              height: 40,
              child: Icon(
                Icons.add,
                color: currentIndex == 1
                    ? AppTheme.Colors.textEnabled
                    : AppTheme.Colors.iconInactive,
              ),
              decoration: BoxDecoration(
                color: currentIndex == 1
                    ? AppTheme.Colors.primary
                    : AppTheme.Colors.background,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            Container(
              width: 40,
              height: 40,
              child: Icon(
                Icons.settings,
                color: currentIndex == 2
                    ? AppTheme.Colors.textEnabled
                    : AppTheme.Colors.iconInactive,
              ),
              decoration: BoxDecoration(
                color: currentIndex == 2
                    ? AppTheme.Colors.primary
                    : AppTheme.Colors.background,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
