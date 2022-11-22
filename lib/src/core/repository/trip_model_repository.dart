import 'package:trip_demo/src/core/local/dao/trip_model_dao.dart';
import 'package:trip_demo/src/core/model/trip_model.dart';

class TripModelRepository {
  final TripModelDao tripModelDao;

  TripModelRepository({required this.tripModelDao});

  Stream<List<TripModel>> watchTripModels() =>
      tripModelDao.watchAllTripModels();

  Future<void> addTripModel(TripModel trip) => tripModelDao.insert(trip);

  Future<void> updateTripModel(TripModel trip) =>
      tripModelDao.updateObject(trip);

  Future<void> deleteTripModelById(int id) =>
      tripModelDao.deleteTripModelById(id);

  Future<void> deleteAllTripModels() async =>
      await tripModelDao.deleteAllTripModel();
}
