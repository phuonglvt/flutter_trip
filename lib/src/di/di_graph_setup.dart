import 'package:trip_demo/src/core/local/app_database.dart';
import 'package:trip_demo/src/core/managers/navigator_manager.dart';
import 'package:trip_demo/src/core/repository/trip_model_repository.dart';
import 'package:get/get.dart';

part 'register_core_module.dart';
part 'register_repositories_module.dart';

Future<void> setupDependenciesGraph() async {
  // Core Dependencies
  await _registerCoreModule();

  // Repositories Dependencies
  await _registerRepositoriesModule();

  Get.put(NavigatorManager());
}
