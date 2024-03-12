import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:soma/soma.dart'; // Garanta que este import esteja correto para o SomaTheme
import 'package:your_project_path/financial_planning_loading_widget.dart'; // Substitua pelo caminho correto

void main() {
  Widget makeTestableWidget({required Widget child}) {
    return MaterialApp(
      home: child,
    );
  }

  group('FinancialPlanningLoadingWidget Tests', () {
    testWidgets('renders correctly with given appBar', (WidgetTester tester) async {
      final testAppBar = AppBar(title: const Text('Loading...'));

      await tester.pumpWidget(makeTestableWidget(
        child: FinancialPlanningLoadingWidget(appbar: testAppBar),
      ));

      expect(find.byType(FinancialPlanningLoadingWidget), findsOneWidget);
      expect(find.text('Loading...'), findsOneWidget);
      // Verifique a presença dos elementos Skeleton
      expect(find.byType(BoxSkeleton), findsWidgets);
    });

    testWidgets('has correct background color', (WidgetTester tester) async {
      final testAppBar = AppBar(title: const Text('Loading...'));

      await tester.pumpWidget(makeTestableWidget(
        child: FinancialPlanningLoadingWidget(appbar: testAppBar),
      ));

      final Scaffold scaffold = tester.widget(find.byType(Scaffold));
      final theme = SomaTheme.getDesignTokensOf(tester.element(find.byType(Scaffold)));

      // Verifica se a cor de fundo do Scaffold corresponde ao esperado do tema
      expect(scaffold.backgroundColor, theme.colors.neutral.light.one);
    });

    // Adicione mais testes conforme necessário para cobrir outros aspectos da widget
  });
}
