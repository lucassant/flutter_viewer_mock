import 'package:flutter/material.dart';
import 'package:soma/soma.dart';

class FinancialPlanningLoadingWidget extends StatelessWidget {
  final PreferredSizeWidget appbar;
  const FinancialPlanningLoadingWidget({super.key, required this.appbar});

  @override
  Widget build(BuildContext context) {
    final theme = SomaTheme.getDesignTokensOf(context);
    return Scaffold(
      backgroundColor: theme.colors.neutral.light.one,
      appBar: appbar,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: theme.spacing.inline.xs),
        child: SkeletonScope(
          runAnimation: true,
          child: Column(
            children: [
              SizedBox(height: theme.spacing.inline.sm),
              BoxSkeleton.circular(72),
              SizedBox(height: theme.spacing.inline.sm),
              BoxSkeleton(
                width: 205,
                height: 26,
                borderRadius: BorderRadius.circular(8),
              ),
              SizedBox(height: theme.spacing.inline.sm),
              BoxSkeleton(
                width: 320,
                height: 42,
                borderRadius: BorderRadius.circular(8),
              ),
              SizedBox(height: theme.spacing.inline.sm),
              BoxSkeleton(
                height: 306,
                borderRadius: BorderRadius.circular(8),
              ),
              Expanded(child: SizedBox(height: theme.spacing.inline.sm)),
              const BoxSkeleton(height: 48),
              SizedBox(height: theme.spacing.inline.sm),
            ],
          ),
        ),
      ),
    );
  }
}
