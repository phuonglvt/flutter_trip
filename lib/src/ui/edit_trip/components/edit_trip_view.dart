import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trip_demo/src/ui/edit_trip/components/input_date_trip.dart';
import 'package:trip_demo/src/ui/edit_trip/components/input_description.dart';
import 'package:trip_demo/src/ui/edit_trip/components/input_destination.dart';
import 'package:trip_demo/src/ui/edit_trip/components/input_name.dart';
import 'package:trip_demo/src/ui/edit_trip/components/risks_assessment.dart';
import 'package:trip_demo/src/ui/edit_trip/interactor/edit_trip_bloc.dart';
import 'package:trip_demo/src/ui/widgets/app_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trip_demo/src/ui/widgets/common/ripple_button.dart';

class EditTripView extends StatelessWidget {
  const EditTripView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditTripBloc, EditTripState>(
      builder: (context, state) {
        final title = state.isEdit ? 'Edit' : 'Create';
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text(title),
            actions: state.isEdit
                ? [
                    IconButton(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      onPressed: () => Get.find<EditTripBloc>()
                          .add(const EditTripEvent.onDeleted()),
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                    )
                  ]
                : null,
          ),
          body: AppBody(
            pageState: state.pageStatus,
            failure: const Text(
                "Sử dụng để hiển thị 1 nút để refresh data, hoặc là 1 widget lỗi, hoặc là ko hiển thị gì"),
            success: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
              children: [
                const InputName(),
                const InputDestination(),
                const InputDateTrip(),
                const RisksAssessment(),
                const InputDescription(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  child: RippleButton(
                    onTap: () {
                      if (state.isEdit) {
                        Get.find<EditTripBloc>()
                            .add(const EditTripEvent.onEdit());
                      } else {
                        Get.find<EditTripBloc>()
                            .add(const EditTripEvent.onCreated());
                      }
                    },
                    title: state.isEdit ? 'Edit' : 'Add To Database',
                  ),
                ),
                if (state.isEdit)
                  RippleButton(
                    onTap: () {},
                    title: 'See all expanses',
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
