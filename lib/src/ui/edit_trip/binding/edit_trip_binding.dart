import 'package:get/get.dart';
import 'package:trip_demo/src/ui/edit_trip/interactor/edit_trip_bloc.dart';

class EditTripBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<EditTripBloc>(EditTripBloc(Get.find()));
  }
}
