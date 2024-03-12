import 'package:flutter/material.dart';
import 'package:soma/soma.dart';

enum ItemsBoxListType { tags, experience }

enum ItemsBoxStyle { card, profile }

class ItemsBoxWidget extends StatelessWidget {

  factory ItemsBoxWidget.cardTags({
    required List<Widget> tags,
    String? title,
  }) {
    return ItemsBoxWidget._(
      title: title,
      items: tags,
      itemsBoxStyle: ItemsBoxStyle.card,
      itemsBoxType: ItemsBoxListType.tags,
    );
  }

  factory ItemsBoxWidget.profileTags({
    required List<Widget> tags,
    String? title,
  }) {
    return ItemsBoxWidget._(
      title: title,
      items: tags,
      itemsBoxStyle: ItemsBoxStyle.profile,
      itemsBoxType: ItemsBoxListType.tags,
    );
  }

  factory ItemsBoxWidget.profileExperience({
    required List<Widget> experiences,
    String? title,
  }) {
    return ItemsBoxWidget._(
      title: title,
      items: experiences,
      itemsBoxStyle: ItemsBoxStyle.profile,
      itemsBoxType: ItemsBoxListType.experience,
    );
  }
  const ItemsBoxWidget._({
    required this.itemsBoxType,
    required this.itemsBoxStyle,
    required this.items,
    this.title,
  });

  final String? title;
  final ItemsBoxListType itemsBoxType;
  final List<Widget> items;
  final ItemsBoxStyle itemsBoxStyle;

  @override
  Widget build(BuildContext context) {
    final theme = SomaTheme.getDesignTokensOf(context);

    double titleSpacing = theme.spacing.inline.xs;
    SomaTypographyType titleTypographyType = SomaTypographyType.heading4;

    if (itemsBoxStyle == ItemsBoxStyle.card) {
      titleSpacing = theme.spacing.inline.xxs;
      titleTypographyType = SomaTypographyType.caption;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _Title(
          title: title,
          titleSpacing: titleSpacing,
          titleTypographyType: titleTypographyType,
        ),
        (itemsBoxType == ItemsBoxListType.tags)
            ? _TagList(items: items)
            : _ExperienceList(items: items),
      ],
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({
    required this.titleSpacing, required this.titleTypographyType, this.title,
  });

  final String? title;
  final SomaTypographyType titleTypographyType;
  final double titleSpacing;

  @override
  Widget build(BuildContext context) {
    if (title == null) {
      return const SizedBox.shrink();
    }

    final theme = SomaTheme.getDesignTokensOf(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SomaText(
          title!,
          type: titleTypographyType,
          customPropsTextStyle: TextStyle(
            color: theme.colors.neutral.dark.pure,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(
          height: titleSpacing,
        ),
      ],
    );
  }
}

class _TagList extends StatelessWidget {
  const _TagList({required this.items});

  final List<Widget> items;

  @override
  Widget build(BuildContext context) {
    final theme = SomaTheme.getDesignTokensOf(context);

    return SizedBox(
      width: double.infinity,
      child: Wrap(
        runSpacing: theme.spacing.inline.xxs,
        children: items,
      ),
    );
  }
}

class _ExperienceList extends StatelessWidget {
  const _ExperienceList({required this.items});

  final List<Widget> items;

  @override
  Widget build(BuildContext context) {
    final theme = SomaTheme.getDesignTokensOf(context);
    final List<Widget> itemsWithSeparator = [];

    for (var element in items) {
      itemsWithSeparator.addAll([
        element,
        SizedBox(
          height: theme.spacing.inline.xs,
        )
      ]);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: itemsWithSeparator,
    );
  }
}
