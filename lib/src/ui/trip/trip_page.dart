import 'package:flutter/material.dart';
import 'package:trip_demo/src/core/managers/navigator_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:trip_demo/src/ui/base/interactor/page_command.dart';
import 'package:trip_demo/src/ui/trip/components/trip_view.dart';
import 'package:trip_demo/src/ui/trip/interactor/trip_bloc.dart';

class TripPage extends StatelessWidget {
  const TripPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          Get.find<TripBloc>()..add(const TripEvent.fetchAllData()),
      child: BlocListener<TripBloc, TripState>(
        listener: (context, state) {
          // Xử lý các lệnh liên quan UI
          if (state.pageCommand is PageCommandNavigatorPage) {
            changePage(state.pageCommand as PageCommandNavigatorPage);
          } else if (state.pageCommand is PageCommandShowToast) {
            showDeletedToast(state.pageCommand as PageCommandShowToast);
          }
          Get.find<TripBloc>().add(const TripEvent.onClearPageCommand());
        },
        child: const TripView(),
      ),
    );
  }

  void changePage(PageCommandNavigatorPage page) async {
    final navigatorManager = Get.find<NavigatorManager>();
    if (page.page != null) {
      final result = await navigatorManager.navigateToPage(page.page!,
          args: page.argument);
      if (result.data == 'delete') {
        Get.find<TripBloc>().add(const TripEvent.onShowToastDeleted());
      }
    } else {
      navigatorManager.popBack(popResult: page.result);
    }
  }

  void showDeletedToast(PageCommandShowToast page) async {
    showToast(message: page.message);
  }
}
