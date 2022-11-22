import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trip_demo/src/ui/trip/components/trip_item.dart';
import 'package:trip_demo/src/ui/trip/interactor/trip_bloc.dart';
import 'package:trip_demo/src/ui/widgets/app_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TripView extends StatelessWidget {
  const TripView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TripBloc, TripState>(builder: (context, state) {
      final trips = state.trips;
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(title: const Text('All Trips'), actions: [
          IconButton(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            onPressed: () =>
                Get.find<TripBloc>().add(const TripEvent.deleteAll()),
            icon: const Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ),
        ]),
        body: AppBody(
          pageState: state.pageStatus,
          failure: const Text(
              "Sử dụng để hiển thị 1 nút để refresh data, hoặc là 1 widget lỗi, hoặc là ko hiển thị gì"),
          success: Stack(
            children: [
              trips.isNotEmpty
                  ? ListView.builder(
                      itemCount: trips.length,
                      itemBuilder: (context, index) => TripItem(
                        index,
                        trips[index],
                      ),
                    )
                  : const Center(child: Text("Empty")),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: FloatingActionButton(
                    onPressed: () => Get.find<TripBloc>().add(
                      const TripEvent.onNavigateToEdit(null),
                    ),
                    shape: const CircleBorder(),
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
