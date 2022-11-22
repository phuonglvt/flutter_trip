import 'package:flutter/material.dart';
import 'package:trip_demo/src/ui/base/base_page.dart';
import 'package:trip_demo/src/ui/base/interactor/page_states.dart';

/// Generic Widget to be used mostly inside a Scaffold body
/// You must pass at least a page state and a success widget
class AppBody extends StatelessWidget {
  final PageState pageState;
  final Widget success;
  final Widget? initial;
  final Widget? loading;
  final Widget? failure;

  const AppBody({
    super.key,
    required this.pageState,
    required this.success,
    this.initial,
    this.loading,
    this.failure,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: _bodyContent(context)),
      ],
    );
  }

  Widget _bodyContent(BuildContext context) {
    switch (pageState) {
      case PageState.initial:
        return initial ?? const SizedBox.shrink();
      case PageState.loading:
        return loading ??
            const Center(child: CircularProgressIndicator.adaptive());
      case PageState.failure:
        return failure ?? const SizedBox.shrink();
      case PageState.success:
        return BasePage(child: success);
    }
  }
}
