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

//////////////////////////////////

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:soma/soma.dart'; // Certifique-se de que soma.dart esteja acessível no seu projeto
import 'your_widget_directory/tag_widget.dart'; // Ajuste o caminho conforme necessário

void main() {
  testWidgets('TagWidget displays with correct text and icon', (WidgetTester tester) async {
    const String testText = 'Test Tag';
    const String testIcon = 'test_icon'; // Substitua 'test_icon' pelo identificador do ícone real que você espera

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: TagWidget(
          text: testText,
          icon: testIcon,
        ),
      ),
    ));

    // Testa se os componentes principais estão presentes
    expect(find.byType(Container), findsOneWidget);
    expect(find.byType(SomaIcon), findsOneWidget);
    expect(find.text(testText), findsOneWidget);

    // Testa as propriedades do ícone
    final SomaIcon somaIcon = tester.widget(find.byType(SomaIcon));
    expect(somaIcon.data, SomaIconData(testIcon));
    expect(somaIcon.size, SomaIconSize.sm);

    // Testa as propriedades do texto
    final SomaText somaText = tester.widget(find.byType(SomaText));
    expect(somaText.data, testText);
    expect(somaText.type, SomaTypographyType.caption);

    // Aqui você pode adicionar mais verificações para espaçamento, margem, padding, cor da borda, etc.
  });
}

