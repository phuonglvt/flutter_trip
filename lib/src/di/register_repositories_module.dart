part of 'di_graph_setup.dart';

Future<void> _registerRepositoriesModule() async {
  Get.put(
      TripModelRepository(tripModelDao: Get.find<AppDatabase>().tripModelDao));
}
