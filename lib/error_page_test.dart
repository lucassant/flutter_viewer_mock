// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:recipes/recipes.dart';
import 'package:recommended_wallet/src/orders/domain/entity/recommended_orders_result.dart';
import 'package:soma/soma.dart';

import 'recommended_orders_click_mediator.dart';

class RecommendedOrdersEmptyWidget extends StatelessWidget {
  const RecommendedOrdersEmptyWidget({
    required this.empty,
    required this.clickMediator,
    Key? key,
  }) : super(key: key);

  final Empty empty;
  final OrdersClickMediator clickMediator;

  @override
  Widget build(BuildContext context) {
    final tokens = SomaTheme.getDesignTokensOf(context);
    final colors = tokens.colors;

    return SafeArea(
      child: Scaffold(
        backgroundColor: colors.neutral.dark.pure,
        appBar: SomaTopBar.defaultTopBar(
          title: SomaText(
            empty.header.title,
            type: SomaTypographyType.heading4,
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FeedbackXL(
              title: empty.content.title,
              icon: SomaIcons.empty,
              description: empty.content.description,
              type: FeedbackXLType.info,
            ),
            SomaButtonBlocked(
              onPressed: () => clickMediator.sendEvent(
                uri: empty.bottomAction.action,
                digitalAnalytics: empty.bottomAction.digitalAnalytics,
              ),
              label: empty.bottomAction.title,
            ),
          ],
        ),
      ),
    );
  }
}
