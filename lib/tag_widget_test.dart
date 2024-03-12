import 'package:financial_planning/features/shared/utils/string_with_icon.dart';

typedef ListFromJson = Function(Map<String, dynamic> json);

extension ListSerialize on List {
  List<T> fromJson<T>({required ListFromJson mapper}) {
    return map<T>((json) => mapper(json)).toList();
  }
}

extension ListSerializeNull on List? {
  List<T> fromJson<T>({required ListFromJson mapper}) {
    return this?.map<T>((json) => mapper(json)).toList() ?? [];
  }
}

extension StringList on List<StringWithIcon>? {
  List<String> getListString() {
    return this?.map<String>((item) => item.description).toList() ?? <String>[];
  }
}

extension FilterKey on String {
  String toFilterKeyFormat() => "Filter.${this[0].toUpperCase()}${substring(1)}";
}

extension AnalyticsFormat on String {
  String toItemLabelFormat() => trim().replaceAll(' ', '-');
}
