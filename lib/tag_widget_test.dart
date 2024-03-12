import 'dart:io';

import 'package:dio_export/dio.dart';
import 'package:injectable_export/injectable.dart';
import 'package:pdf_view/pdf_view.dart';
import '../../../shared/bases/bases.dart';

@injectable
class FinancialPlanningPdfDataSource extends DataSourceBase {
  FinancialPlanningPdfDataSource(super.client);

  Future<File> downloadPdfFromUrl({
    required String pdfUrl,
  }) async {
    final PDFDataSource pdfDataSource = PDFDataSourceImpl();

    final Dio dio = await client.getDioInstanceForURL();

    final pdfFile = await pdfDataSource.getFromUrl(
      dio,
      pdfUrl,
    );

    return pdfFile;
  }
}
