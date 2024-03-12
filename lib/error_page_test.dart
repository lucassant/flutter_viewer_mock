import 'package:flutter/material.dart';
import 'package:soma/soma.dart';

class ErrorPageWidget extends StatelessWidget {
  const ErrorPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = SomaTheme.getDesignTokensOf(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SomaIcon(
          SomaIcons.refreshCcw,
          size: SomaIconSize.md,
          color: theme.colors.brand.three,
        ),
        SizedBox(
          width: double.infinity,
          height: theme.spacing.inline.xs,
        ),
        SomaText(
          'Não foi possível carregar os dados',
          type: SomaTypographyType.caption,
          customPropsTextStyle: TextStyle(
            color: theme.colors.neutral.dark.pure,
          ),
        )
      ],
    );
  }
}
