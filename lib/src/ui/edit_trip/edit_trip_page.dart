import 'package:flutter/material.dart';
import 'package:trip_demo/src/core/managers/navigator_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:trip_demo/src/ui/base/interactor/page_command.dart';
import 'package:trip_demo/src/ui/edit_trip/components/edit_trip_view.dart';
import 'package:trip_demo/src/ui/edit_trip/interactor/edit_trip_bloc.dart';

class EditTripPage extends StatelessWidget {
  const EditTripPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          Get.find<EditTripBloc>()..add(const EditTripEvent.init()),
      child: BlocListener<EditTripBloc, EditTripState>(
        listener: (context, state) {
          // Xử lý các lệnh liên quan UI
          if (state.pageCommand is PageCommandDialog) {
            showDialog(state.pageCommand as PageCommandDialog);
          }
          Get.find<EditTripBloc>()
              .add(const EditTripEvent.onClearPageCommand());
        },
        child: const EditTripView(),
      ),
    );
  }

  void showDialog(PageCommandDialog page) {
    Get.dialog(
        AlertDialog(
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
          backgroundColor: const Color(0xFFF5F5F5),
          content: Text(
            page.content,
            textAlign: TextAlign.center,
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            InkWell(
              onTap: () {
                if (page.result != null) {
                  Get.find<NavigatorManager>()
                      .offNamedUntil(page.result!.resultFromPage);
                } else {
                  Get.find<NavigatorManager>().popBack();
                }
              },
              child: const Text(
                'Close',
                style: TextStyle(color: Colors.blueAccent),
              ),
            )
          ],
        ),
        barrierColor: Colors.white);
  }
}
