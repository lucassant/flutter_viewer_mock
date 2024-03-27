import 'package:flutter/material.dart';
import 'package:recipes/recipes.dart';
import 'package:soma/soma.dart';

import '../../../widgets/xpuzzle_component.dart';

final class ListItemModel {
  ListItemModel({
    required this.title,
    this.overline,
    this.subtitle,
    this.leading,
    this.trailing,
    this.trailingPlus,
    this.lines = ListItemLines.twoLines,
    this.dividerIndent = SomaDividerIndent.none,
    this.hasDivider,
    this.applyVerticalPadding = true,
    this.action,
  });

  factory ListItemModel.fromJson(Map<String, dynamic> data) {
    Widget? xpTrailing;
    Widget? xpLeading;
    Widget? xpTrailingPlus;

    if (data['trailing'] != null) {
      xpTrailing = _getWidgetByXPuzzleMap(
        xpuzzleMap: data['trailing'],
      );
    }

    if (data['leading'] != null) {
      xpLeading = _getWidgetByXPuzzleMap(
        xpuzzleMap: data['leading'],
      );
    }

    if (data['trailingPlus'] != null) {
      xpTrailingPlus = _getWidgetByXPuzzleMap(
        xpuzzleMap: data['trailingPlus'],
      );
    }
    return ListItemModel(
      title: data['title'],
      overline: data['overline'],
      subtitle: data['subtitle'],
      leading: xpLeading,
      trailing: xpTrailing,
      trailingPlus: xpTrailingPlus,
      lines: data['lines'] ?? ListItemLines.twoLines,
      dividerIndent: data['dividerIndent'] ?? SomaDividerIndent.none,
      hasDivider: data['hasDivider'],
      action: data['action'] ?? '',
    );
  }
  final String title;
  final String? overline;
  final String? subtitle;
  final Widget? leading;
  final Widget? trailing;
  final Widget? trailingPlus;
  final ListItemLines lines;
  final SomaDividerIndent dividerIndent;
  final bool? hasDivider;
  final bool applyVerticalPadding;
  final String? action;

  static Widget? _getWidgetByXPuzzleMap({
    required Map<String, dynamic> xpuzzleMap,
  }) {
    if (xpuzzleMap.isNotEmpty) {
      return XPuzzleComponent(
        component: xpuzzleMap,
        index: 0,
      );
    }
    return null;
  }
}
