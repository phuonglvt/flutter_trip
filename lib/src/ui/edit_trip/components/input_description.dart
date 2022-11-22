import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:trip_demo/src/ui/edit_trip/interactor/edit_trip_bloc.dart';
import 'package:trip_demo/src/ui/widgets/common/custom_text_form_field.dart';

class InputDescription extends StatelessWidget {
  const InputDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditTripBloc, EditTripState>(builder: (context, state) {
      return CustomTextFormField(
        controller: state.descriptionController,
        titleText: 'Description',
        hintText: 'Description...',
        radius: 0,
        isRequired: false,
        maxLines: 5,
        onChanged: (String description) => Get.find<EditTripBloc>()
            .add(EditTripEvent.saveDescription(description)),
      );
    });
  }
}
