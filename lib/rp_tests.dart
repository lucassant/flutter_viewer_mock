class MockFinancialPlanningPdfDataSource extends Mock implements FinancialPlanningPdfDataSource {}

void main() {
  group('FinancialPlanningPdfRepositoryImpl Tests', () {
    late MockFinancialPlanningPdfDataSource mockDataSource;
    late FinancialPlanningPdfRepositoryImpl repository;

    setUp(() {
      mockDataSource = MockFinancialPlanningPdfDataSource();
      repository = FinancialPlanningPdfRepositoryImpl(mockDataSource);
    });

    test('getPdfFile should retrieve PDF file from the data source', () async {
      const String pdfUrl = 'https://example.com/pdf';
      final MockFile mockFile = MockFile();

      // Configure o mock para retornar um arquivo quando o método downloadPdfFromUrl for chamado
      when(mockDataSource.downloadPdfFromUrl(pdfUrl: pdfUrl)).thenAnswer((_) async => mockFile);

      final file = await repository.getPdfFile(pdfUrl: pdfUrl);

      // Verifica se o método downloadPdfFromUrl foi chamado no dataSource
      verify(mockDataSource.downloadPdfFromUrl(pdfUrl: pdfUrl)).called(1);

      // Verifica se o arquivo retornado é o esperado
      expect(file, equals(mockFile));
    });

    // Adicione mais testes conforme necessário
  });
}
