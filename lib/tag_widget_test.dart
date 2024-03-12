import 'package:flutter_test/flutter_test.dart';
import 'package:financial_planning/features/shared/utils/string_with_icon.dart'; // Ajuste para o caminho correto

void main() {
  group('List Extensions', () {
    test('fromJson on non-null List', () {
      final list = [
        {'description': 'Item 1', 'icon': 'icon1'},
        {'description': 'Item 2', 'icon': 'icon2'}
      ];

      final result = list.fromJson<StringWithIcon>(mapper: (json) => StringWithIcon.fromJson(json));

      expect(result.length, 2);
      expect(result[0], isA<StringWithIcon>());
      expect(result[0].description, 'Item 1');
    });

    test('fromJson on null List', () {
      List? list;

      final result = list.fromJson<StringWithIcon>(mapper: (json) => StringWithIcon.fromJson(json));

      expect(result, isEmpty);
    });

    test('getListString', () {
      final list = [
        StringWithIcon(description: 'Item 1', icon: 'icon1'),
        StringWithIcon(description: 'Item 2', icon: 'icon2')
      ];

      final result = list.getListString();

      expect(result, ['Item 1', 'Item 2']);
    });
  });

  group('String Extensions', () {
    test('toFilterKeyFormat', () {
      final key = 'testKey';

      final result = key.toFilterKeyFormat();

      expect(result, 'Filter.TestKey');
    });

    test('toItemLabelFormat', () {
      final label = 'Test Label';

      final result = label.toItemLabelFormat();

      expect(result, 'Test-Label');
    });
  });
}
