import 'package:equatable_export/equatable.dart';

class StringWithIcon extends Equatable {
  const StringWithIcon({
    required this.description,
    this.icon,
  });

  final String description;
  final String? icon;

  @override
  List<Object?> get props => [
        description,
        icon,
      ];
}
