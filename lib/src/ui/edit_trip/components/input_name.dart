import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:trip_demo/src/ui/edit_trip/interactor/edit_trip_bloc.dart';
import 'package:trip_demo/src/ui/widgets/common/custom_text_form_field.dart';

class InputName extends StatelessWidget {
  const InputName({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditTripBloc, EditTripState>(builder: (context, state) {
      return CustomTextFormField(
        controller: state.nameController,
        titleText: 'Name',
        hintText: 'Name',
        radius: 0,
        onChanged: (String name) =>
            Get.find<EditTripBloc>().add(EditTripEvent.saveName(name)),
      );
    });
  }
}
