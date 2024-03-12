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

-----------------------


  import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:soma/soma.dart'; // Certifique-se de que soma.dart esteja acessível no seu projeto
import 'seu_widget_directory/error_page_widget.dart'; // Substitua 'seu_widget_directory' pelo caminho correto

void main() {
  // O WidgetTester permite construir e interagir com widgets no ambiente de teste
  testWidgets('ErrorPageWidget tests', (WidgetTester tester) async {
    // Inicializando o widget para teste
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: ErrorPageWidget(),
      ),
    ));

    // 1. Teste de presença do ícone de erro
    expect(find.byIcon(SomaIcons.refreshCcw), findsOneWidget);
    final SomaIcon somaIcon = tester.firstWidget(find.byType(SomaIcon));
    expect(somaIcon.size, SomaIconSize.md);

    // 2. Teste de espaçamento
    expect(find.byType(SizedBox), findsWidgets);
    final SizedBox sizedBox = tester.widget(find.byType(SizedBox).at(0));
    expect(sizedBox.height, SomaTheme.of(tester.element(find.byType(SizedBox))).spacing.inline.xs);

    // 3. Teste de presença do texto de erro
    expect(find.text('Não foi possível carregar os dados'), findsOneWidget);
    final SomaText somaText = tester.firstWidget(find.byType(SomaText));
    expect(somaText.type, SomaTypographyType.caption);
    expect((somaText.style as TextStyle).color, SomaTheme.of(tester.element(find.byType(SomaText))).colors.neutral.dark.pure);
  });
}
