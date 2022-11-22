part of 'di_graph_setup.dart';

Future<void> _registerCoreModule() async {
  // Todo: Initialize Firebase
  // await Firebase.initializeApp();

  // Database
  await Get.putAsync(() => AppDatabase.build());

  // Firebase Auth
  // Get.put(FirebaseAuth.instance);
}
