import 'package:get/get.dart';
import 'package:trip_demo/src/ui/trip/interactor/trip_bloc.dart';
import 'package:trip_demo/src/ui/trip/usecases/fetch_all_trips_usecase.dart';

class TripBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(FetchAllTripsUseCase(Get.find()));
    Get.put<TripBloc>(TripBloc(
      Get.find(),
      Get.find(),
    ));
  }
}
