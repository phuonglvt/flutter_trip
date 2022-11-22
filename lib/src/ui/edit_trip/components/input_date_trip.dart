import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:trip_demo/src/ui/edit_trip/interactor/edit_trip_bloc.dart';
import 'package:trip_demo/src/ui/widgets/common/custom_text_form_field.dart';

class InputDateTrip extends StatelessWidget {
  const InputDateTrip({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditTripBloc, EditTripState>(builder: (context, state) {
      return CustomTextFormField(
        controller: state.dateController,
        titleText: 'Date of the Trip',
        hintText: '15/05/2022',
        radius: 0,
        onChanged: (String date) =>
            Get.find<EditTripBloc>().add(EditTripEvent.saveDate(date)),
      );
    });
  }
}
