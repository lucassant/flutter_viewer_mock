import 'package:bloc_test/bloc_test.dart';
import 'package:financial_planning/features/financial_planning_pdf/presentation/cubit/financial_planning_pdf_cubit.dart';
import 'package:financial_planning/features/financial_planning_pdf/presentation/pages/financial_planning_pdf_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

// Mocks
class MockFinancialPlanningPdfCubit extends MockBloc<FinancialPlanningPdfEvent, FinancialPlanningPdfState> implements FinancialPlanningPdfCubit {}

class MockFinancialPlanningModel extends Mock implements FinancialPlanningModel {}

// Anotação para o Mockito gerar os arquivos necessários
@GenerateMocks([FinancialPlanningPdfCubit, FinancialPlanningModel])
void main() {
  late MockFinancialPlanningPdfCubit mockCubit;
  late MockFinancialPlanningModel mockModel;

  setUp(() {
    mockCubit = MockFinancialPlanningPdfCubit();
    mockModel = MockFinancialPlanningModel();
    // Configura o GetIt para fornecer o mockCubit quando for solicitado um FinancialPlanningPdfCubit
    GetIt.I.registerFactory<FinancialPlanningPdfCubit>(() => mockCubit);
  });

  tearDown(() {
    GetIt.I.unregister<FinancialPlanningPdfCubit>();
  });

  testWidgets('FinancialPlanningPdfPage shows loading state initially', (WidgetTester tester) async {
    whenListen(mockCubit, Stream.fromIterable([FinancialPlanningPdfLoadingState()]), initialState: FinancialPlanningPdfInitialState());

    await tester.pumpWidget(MaterialApp(
      home: FinancialPlanningPdfPage(financialPlanningModel: mockModel),
    ));

    // Verifica se a página de carregamento é exibida
    expect(find.byType(FinancialPlanningPdfLoadingPage), findsOneWidget);
  });

  testWidgets('FinancialPlanningPdfPage shows loaded page on success', (WidgetTester tester) async {
    whenListen(mockCubit, Stream.fromIterable([FinancialPlanningPdfLoadedState(pdfFilePath: 'path/to/file')]), initialState: FinancialPlanningPdfInitialState());

    await tester.pumpWidget(MaterialApp(
      home: FinancialPlanningPdfPage(financialPlanningModel: mockModel),
    ));

    // Verifica se a página carregada é exibida com o arquivo PDF correto
    expect(find.byType(FinancialPlanningPdfLoadedPage), findsOneWidget);
  });

  testWidgets('FinancialPlanningPdfPage shows error page on failure', (WidgetTester tester) async {
    whenListen(mockCubit, Stream.fromIterable([FinancialPlanningPdfErrorState()]), initialState: FinancialPlanningPdfInitialState());

    await tester.pumpWidget(MaterialApp(
      home: FinancialPlanningPdfPage(financialPlanningModel: mockModel),
    ));

    // Verifica se a página de erro é exibida
    expect(find.byType(FinancialPlanningPdfErrorPage), findsOneWidget);

    // Testa o botão de tentar novamente
    final Finder retryButton = find.byType(ElevatedButton); // Substitua ElevatedButton pelo tipo correto de botão se necessário
    await tester.tap(retryButton);
    await tester.pump();

    // Verifica se o cubit foi chamado para tentar novamente
    verify(mockCubit.getFinancialPlanningPdf(pdfUrl: anyNamed('pdfUrl'))).called(1);
  });

  // Mais testes podem ser adicionados para cobrir diferentes cenários e interações
}
