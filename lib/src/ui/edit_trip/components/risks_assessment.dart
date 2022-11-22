import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:trip_demo/src/ui/edit_trip/interactor/edit_trip_bloc.dart';

class RisksAssessment extends StatelessWidget {
  const RisksAssessment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditTripBloc, EditTripState>(builder: (context, state) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 8),
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Require Risks Assessment',
                    style: TextStyle(fontWeight: FontWeight.normal),
                  ),
                  TextSpan(text: ' *', style: TextStyle(color: Colors.red)),
                ],
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () => Get.find<EditTripBloc>()
                      .add(const EditTripEvent.saveRiskAssessment(true)),
                  child: selectedButton("Yes", state.trip.risk),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () => Get.find<EditTripBloc>()
                      .add(const EditTripEvent.saveRiskAssessment(false)),
                  child: selectedButton(
                      "No", state.trip.risk != null ? !state.trip.risk! : null),
                ),
              ),
            ],
          )
        ],
      );
    });
  }

  Widget selectedButton(String title, bool? isSelected) {
    return Row(
      children: [
        Icon(
          isSelected == null || !isSelected
              ? Icons.circle
              : Icons.check_circle_outlined,
          color: isSelected == null || !isSelected
              ? Colors.grey.withOpacity(0.7)
              : const Color(0xFF4D5DFA),
        ),
        const SizedBox(width: 4),
        Text(title),
      ],
    );
  }
}
