import 'package:get/get.dart';
import 'package:trip_demo/src/ui/edit_trip/binding/edit_trip_binding.dart';
import 'package:trip_demo/src/ui/edit_trip/edit_trip_page.dart';
import 'package:trip_demo/src/ui/trip/binding/trip_binding.dart';
import 'package:trip_demo/src/ui/trip/trip_page.dart';

class AppPages {
  static const String allTrips = _Paths.allTrips;
  static const String editTrip = _Paths.editTrip;

  static final pages = [
    GetPage(
      name: _Paths.allTrips,
      page: () => const TripPage(),
      binding: TripBinding(),
    ),
    GetPage(
      name: _Paths.editTrip,
      page: () => const EditTripPage(),
      binding: EditTripBinding(),
    ),
  ];
}

abstract class _Paths {
  static const String allTrips = "/all_trips";
  static const String editTrip = "/edit_trip";
}
