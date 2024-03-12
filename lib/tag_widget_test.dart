import 'dart:convert';
import 'package:equatable_export/equatable.dart';

class FinancialPlanningModel extends Equatable {
  const FinancialPlanningModel({
    required this.content,
    required this.bottomDrawer,
    required this.buttomName,
    required this.pdfUrl,
  });
  factory FinancialPlanningModel.fromMap(Map<String, dynamic> map) {
    return FinancialPlanningModel(
      content: json.encode(map['content']),
      bottomDrawer: json.encode(map['bottomDrawer']),
      buttomName: map['buttomName'] ?? '',
      pdfUrl: map['pdfUrl'] ?? '',
    );
  }
  final String content;
  final String bottomDrawer;
  final String buttomName;
  final String pdfUrl;
  @override
  List<Object> get props => [
        content,
        bottomDrawer,
        buttomName,
        pdfUrl,
      ];
}
