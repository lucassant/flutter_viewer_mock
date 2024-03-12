import 'package:flutter/material.dart';
import 'package:soma/soma.dart';

class NotLoadedPageWidget extends StatelessWidget {
  const NotLoadedPageWidget({
    required this.title, required this.body, this.backgroundColor,
    super.key,
  });

  final String title;
  final Widget body;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final theme = SomaTheme.getDesignTokensOf(context);

    return Scaffold(
      backgroundColor: backgroundColor ?? theme.colors.neutral.light.pure,
      appBar: SomaTopBar.defaultTopBar(
        backgroundColor: backgroundColor ?? theme.colors.neutral.light.pure,
        title: SomaText(
          title,
          type: SomaTypographyType.heading4,
        ),
      ),
      body: body,
    );
  }
}
