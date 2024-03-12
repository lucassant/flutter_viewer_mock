import 'package:flutter_test/flutter_test.dart';
import 'package:your_project_path/financial_planning_model.dart'; // Substitua pelo caminho correto do arquivo

void main() {
  group('FinancialPlanningModel Props Tests', () {
    test('props contains all fields', () {
      const content = '{"key": "value"}';
      const bottomDrawer = '{"drawerKey": "drawerValue"}';
      const buttomName = 'TestButton';
      const pdfUrl = 'http://example.com/test.pdf';

      const model = FinancialPlanningModel(
        content: content,
        bottomDrawer: bottomDrawer,
        buttomName: buttomName,
        pdfUrl: pdfUrl,
      );

      expect(model.props, [content, bottomDrawer, buttomName, pdfUrl]);
    });

    test('equality when all fields are the same', () {
      const model1 = FinancialPlanningModel(
        content: 'content',
        bottomDrawer: 'bottomDrawer',
        buttomName: 'buttomName',
        pdfUrl: 'pdfUrl',
      );
      const model2 = FinancialPlanningModel(
        content: 'content',
        bottomDrawer: 'bottomDrawer',
        buttomName: 'buttomName',
        pdfUrl: 'pdfUrl',
      );

      expect(model1, equals(model2));
    });

    test('non-equality when at least one field differs', () {
      const model1 = FinancialPlanningModel(
        content: 'content1',
        bottomDrawer: 'bottomDrawer',
        buttomName: 'buttomName',
        pdfUrl: 'pdfUrl',
      );
      const model2 = FinancialPlanningModel(
        content: 'content2',
        bottomDrawer: 'bottomDrawer',
        buttomName: 'buttomName',
        pdfUrl: 'pdfUrl',
      );

      expect(model1, isNot(equals(model2)));
    });

    // Teste adicional para verificar a não igualdade quando apenas um dos outros campos é diferente
    test('non-equality on different buttomName', () {
      const model1 = FinancialPlanningModel(
        content: 'content',
        bottomDrawer: 'bottomDrawer',
        buttomName: 'buttomName1',
        pdfUrl: 'pdfUrl',
      );
      const model2 = FinancialPlanningModel(
        content: 'content',
        bottomDrawer: 'bottomDrawer',
        buttomName: 'buttomName2',
        pdfUrl: 'pdfUrl',
      );

      expect(model1, isNot(equals(model2)));
    });
  });
}
