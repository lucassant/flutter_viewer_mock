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


---------------------------------

  import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:soma/soma.dart'; // Certifique-se de que soma.dart esteja acessível no seu projeto
import 'your_widget_directory/not_loaded_page_widget.dart'; // Ajuste o caminho conforme necessário

void main() {
  testWidgets('NotLoadedPageWidget displays with default background color', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: NotLoadedPageWidget(
        title: 'Not Loaded',
        body: Text('Try again later'),
      ),
    ));

    // Testa se o Scaffold está sendo usado
    expect(find.byType(Scaffold), findsOneWidget);

    // Testa a cor de fundo padrão (considerando que você tenha acesso à instância de tema para verificar a cor)
    final Scaffold scaffold = tester.widget(find.byType(Scaffold));
    expect(scaffold.backgroundColor, SomaTheme.of(tester.element(find.byType(Scaffold))).colors.neutral.light.pure);

    // Testa a presença da AppBar e do título
    expect(find.byType(SomaTopBar), findsOneWidget);
    expect(find.text('Not Loaded'), findsOneWidget);

    // Testa a presença do corpo
    expect(find.text('Try again later'), findsOneWidget);
  });

  testWidgets('NotLoadedPageWidget applies custom background color', (WidgetTester tester) async {
    final Color customColor = Colors.red;

    await tester.pumpWidget(MaterialApp(
      home: NotLoadedPageWidget(
        title: 'Custom Background',
        body: Text('This has a custom background color'),
        backgroundColor: customColor,
      ),
    ));

    // Testa se a cor de fundo personalizada é aplicada
    final Scaffold scaffold = tester.widget(find.byType(Scaffold));
    expect(scaffold.backgroundColor, customColor);
  });
}
