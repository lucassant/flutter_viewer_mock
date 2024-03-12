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


----------------------------------------------------------------------------------------------------------------


  import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:soma/soma.dart'; // Certifique-se de que soma.dart esteja acessível no seu projeto
import 'your_widget_directory/items_box_widget.dart'; // Ajuste o caminho conforme necessário

void main() {
  group('ItemsBoxWidget Tests', () {
    // Dummy widgets para representar tags e experiências
    final List<Widget> dummyTags = List<Widget>.generate(3, (index) => Chip(label: Text('Tag $index')));
    final List<Widget> dummyExperiences = List<Widget>.generate(3, (index) => ListTile(title: Text('Experience $index')));

    testWidgets('cardTags constructor creates correct layout', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: ItemsBoxWidget.cardTags(tags: dummyTags, title: 'Tags'),
        ),
      ));

      // Verifica a presença do título com o estilo correto
      expect(find.text('Tags'), findsOneWidget);
      // Verifica se a lista de tags está sendo renderizada
      expect(find.byType(Chip), findsNWidgets(dummyTags.length));
    });

    testWidgets('profileTags constructor creates correct layout', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: ItemsBoxWidget.profileTags(tags: dummyTags, title: 'Profile Tags'),
        ),
      ));

      // Verifica a presença do título com o estilo correto
      expect(find.text('Profile Tags'), findsOneWidget);
      // Verifica se a lista de tags está sendo renderizada
      expect(find.byType(Chip), findsNWidgets(dummyTags.length));
    });

    testWidgets('profileExperience constructor creates correct layout', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: ItemsBoxWidget.profileExperience(experiences: dummyExperiences, title: 'Experience'),
        ),
      ));

      // Verifica a presença do título com o estilo correto
      expect(find.text('Experience'), findsOneWidget);
      // Verifica se a lista de experiências está sendo renderizada
      expect(find.byType(ListTile), findsNWidgets(dummyExperiences.length));
    });

    // Mais testes podem ser adicionados aqui para verificar a ausência do título, diferentes estilos e tipos, etc.
  });
}

