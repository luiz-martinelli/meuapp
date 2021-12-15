import 'package:flutter/material.dart';
import 'package:meuapp/shared/models/user_model.dart';
import 'package:meuapp/shared/theme/app_theme.dart';

class HomePage extends StatelessWidget {
  //final UserModel user;
  const HomePage({
    Key? key,
    /*required this.user*/
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppTheme.Colors.background,
        body: Stack(
          children: [
            Positioned(
              bottom: 14,
              left: 26,
              right: 26,
              child: Padding(
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
              ),
            )
          ],
        ));
  }
}
