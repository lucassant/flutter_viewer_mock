import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dio/dio.dart';
import 'package:your_project_path/data_source_base.dart'; // Substitua pelo caminho correto
import 'package:your_project_path/network_provider.dart'; // Substitua pelo caminho correto

class MockNetworkProvider extends Mock implements NetworkProvider {}

class MockDio extends Mock implements Dio {}

class MockResponse<T> extends Mock implements Response<T> {}

void main() {
  late MockNetworkProvider mockNetworkProvider;
  late MockDio mockDio;
  late DataSourceBase dataSourceBase;

  setUp(() {
    mockNetworkProvider = MockNetworkProvider();
    mockDio = MockDio();
    dataSourceBase = DataSourceBase(mockNetworkProvider);

    // Configuração do mock para retornar uma instância de Dio quando getDioInstanceForURL for chamado
    when(() => mockNetworkProvider.getDioInstanceForURL()).thenAnswer((_) async => mockDio);
  });

  group('DataSourceBase', () {
    test('makeGet returns data on HttpStatus.ok', () async {
      final mockResponse = MockResponse<Map<String, dynamic>>();
      when(() => mockResponse.statusCode).thenReturn(HttpStatus.ok);
      when(() => mockResponse.data).thenReturn({'key': 'value'});

      when(() => mockDio.get(any(), queryParameters: any(named: "queryParameters")))
          .thenAnswer((_) async => mockResponse);

      final result = await dataSourceBase.makeGet(
        url: 'https://test.com',
        returnMapper: (map) => map, // Simplesmente retorna o Map para testar
      );

      expect(result, {'key': 'value'});
    });

    test('makePost executes successfully on HttpStatus.created', () async {
      final mockResponse = MockResponse<void>();
      when(() => mockResponse.statusCode).thenReturn(HttpStatus.created);

      when(() => mockDio.post(any(), data: any(named: "data"))).thenAnswer((_) async => mockResponse);

      await dataSourceBase.makePost(
        url: 'https://test.com',
        data: {'key': 'value'},
      );

      // Verifica se o método post foi chamado no mockDio
      verify(() => mockDio.post(any(), data: any(named: "data"))).called(1);
    });

    // Adicione mais testes para cobrir diferentes cenários, como respostas de erro, falhas de rede, etc.
  });
}
