import 'package:flutter/material.dart';

import 'package:meuapp/shared/theme/app_theme.dart';
import 'package:meuapp/shared/widgets/chart_horizontal/chart_horizontal.dart';

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
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Gasto mensal").label,
            const SizedBox(
              height: 18,
            ),
            Text.rich(
              TextSpan(
                text: "R\$",
                style: AppTheme.textStyles.label,
                children: [
                  TextSpan(
                    text: value.toStringAsFixed(2).replaceAll(".", ","),
                    style: AppTheme.textStyles.title.copyWith(fontSize: 36),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const ChartHorizontal()
          ],
        ),
      ),
    );
  }
}
