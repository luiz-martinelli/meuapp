import 'package:flutter/material.dart';
import 'package:meuapp/shared/theme/app_text.dart';
import 'package:meuapp/shared/widgets/card_chart/card_chard.dart';
import 'package:meuapp/shared/widgets/card_product/card_product.dart';
import 'package:meuapp/shared/widgets/list_title/app_list_title.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CardChart(
                    value: 365,
                    percent: 1,
                  ),
                  const SizedBox(
                    height: 27,
                  ),
                  const Text("Preço dos produtos").label,
                  const SizedBox(
                    height: 14,
                  ),
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 126,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => CardProduct(
                  like: index % 2 == 0,
                ),
              ),
            ),
            const SizedBox(
              height: 27,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Suas últimas compras").label,
                  const SizedBox(
                    height: 14,
                  ),
                  const AppListTitle(),
                  const AppListTitle(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
