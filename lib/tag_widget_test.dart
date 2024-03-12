import 'package:flutter/material.dart';
import 'package:soma/soma.dart';

class TagWidget extends StatelessWidget {
  const TagWidget({
    required this.text,
    required this.icon,
    super.key,
  });

  final String text;
  final String icon;

  @override
  Widget build(BuildContext context) {
    final theme = SomaTheme.getDesignTokensOf(context);

    return Container(
      margin: EdgeInsets.only(
        right: theme.spacing.inline.xxs,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: theme.spacing.inline.xxs,
        vertical: theme.spacing.inline.xxxs,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        border: Border.all(
          color: theme.colors.neutral.light.three,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SomaIcon(
            SomaIconData(icon),
            size: SomaIconSize.sm,
            color: theme.colors.brand.two,
          ),
          SizedBox(
            width: theme.spacing.inline.xxxs,
          ),
          SomaText(
            text,
            type: SomaTypographyType.caption,
            customPropsTextStyle: TextStyle(
              fontSize: theme.font.size.us,
              height: 1.5,
              color: theme.colors.neutral.dark.one,
            ),
          ),
        ],
      ),
    );
  }
}
