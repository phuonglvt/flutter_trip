import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trip_demo/src/core/model/trip_model.dart';
import 'package:trip_demo/src/ui/trip/interactor/trip_bloc.dart';
import 'package:trip_demo/src/ui/widgets/common/ripple_button.dart';

class TripItem extends StatelessWidget {
  final int index;
  final TripModel tripModel;
  const TripItem(this.index, this.tripModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
      child: RippleButton(
        onTap: () =>
            Get.find<TripBloc>().add(TripEvent.onNavigateToEdit(tripModel)),
        padding: EdgeInsets.zero,
        backgroundColor: Colors.transparent,
        elevation: 0,
        borderRadius: BorderRadius.zero,
        child: Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
          ),
          child: Row(
            children: [
              Text(
                '${index + 1}',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tripModel.name,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      tripModel.destination,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tripModel.dateTime,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Require Assessment: ${tripModel.risk == true ? 'YES' : 'NO'}',
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
