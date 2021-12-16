import 'package:flutter/material.dart';

import 'package:meuapp/shared/theme/app_theme.dart';

class CardChart extends StatelessWidget {
  final double value;
  const CardChart({
    Key? key,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 210,
      decoration: BoxDecoration(
        color: AppTheme.Colors.textEnabled,
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      child: Column(
        children: [
          Text("Gasto mensal").label,
          Text.rich(
            TextSpan(text: "R\$", style: AppTheme.textStyles.label, children: [
              TextSpan(
                text: value.toStringAsFixed(2).replaceAll(".", ","),
                style: AppTheme.textStyles.title.copyWith(fontSize: 36),
              )
            ]),
          )
        ],
      ),
    );
  }
}
