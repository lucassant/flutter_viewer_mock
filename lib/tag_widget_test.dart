import 'package:financial_planning/features/financial_planning/data/models/financial_planning_model.dart';
import 'package:financial_planning/features/financial_planning_pdf/presentation/cubit/financial_planning_pdf_cubit.dart';
import 'package:financial_planning/features/financial_planning_pdf/presentation/pages/financial_planning_pdf_loading_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_export/flutter_bloc.dart';
import 'package:get_it_export/get_it.dart';
import 'package:soma/soma.dart';

import 'financial_planning_pdf_error_page.dart';
import 'financial_planning_pdf_loaded_page.dart';

class FinancialPlanningPdfPage extends StatefulWidget {
  final FinancialPlanningModel financialPlanningModel;
  const FinancialPlanningPdfPage({
    super.key,
    required this.financialPlanningModel,
  });

  @override
  State<FinancialPlanningPdfPage> createState() =>
      _FinancialPlanningPdfPageState();
}

class _FinancialPlanningPdfPageState extends State<FinancialPlanningPdfPage> {
  late final FinancialPlanningPdfCubit _financialPlanningCubit;

  @override
  void initState() {
    _financialPlanningCubit = GetIt.I.get()
      ..getFinancialPlanningPdf(pdfUrl: widget.financialPlanningModel.pdfUrl);
    super.initState();
  }

  @override
  void dispose() {
    _financialPlanningCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SomaTextScale(
        child:
            BlocBuilder<FinancialPlanningPdfCubit, FinancialPlanningPdfState>(
      bloc: _financialPlanningCubit,
      builder: (context, state) {
        if (state is FinancialPlanningPdfInitialState ||
            state is FinancialPlanningPdfLoadingState) {
          return const FinancialPlanningPdfLoadingPage();
        }

        if (state is FinancialPlanningPdfLoadedState) {
          final String pdfFilePath = state.pdfFilePath;

          return FinancialPlanningPdfLoadedPage(
            filePath: pdfFilePath,
            financialPlanningModel: widget.financialPlanningModel,
          );
        }

        return FinancialPlanningPdfErrorPage(
          onRetry: () => _financialPlanningCubit.getFinancialPlanningPdf(
            pdfUrl: widget.financialPlanningModel.pdfUrl,
          ),
        );
      },
    ));
  }
}
